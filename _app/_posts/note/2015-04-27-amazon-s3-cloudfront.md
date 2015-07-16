---
layout: post
title: Amazon S3 × CloudFront
category: note
---

Previously this site was hosted on a Linode VPS, handling thousands of requests a day. It's stable, fast, and has a great support team. But this time I would like to try something new - host my website entirely in the cloud.

The first cloud provider that came to my mind was Amazon S3 and CloudFront. Back in 2010, I tried this combination with no luck. The web hosting feature of S3 was not as expected, and CloudFront did not support custom domain SSL and the apex (root) domain was also not supported. But now I'm happy to see all these features implemented and so I'm going to try this approach again.

Please note that this is not a detailed tutorial about how to host your website on Amazon S3 and CloudFront, but my personal notes about setup pitfalls.

### Transfer everything to the Cloud?

There are two methods you can choose - host static files on Amazon S3 and speed up using CloudFront, or host your website on a remote server using CloudFront as custom origin proxy. Both of these have their pros and cons:

Amazon S3 + CloudFront means you do not have to buy additional servers to host your website, but you have to do more work to ensure your website behaves the same as before. For example, you cannot use `/feed/` (`/feed/index.xml`) as your feed URL because you can set only one Document Index per bucket. If you're using `/feed/` then you have to redirect it to something similar to `feed.xml`. gzip is also not a native feature on S3. You have to compress it manually or use other tools (I will talk about it later).

Using Amazon CloudFront with custom origin means you still need servers to store your files. You will have more control with your website, for example, you can use Nginx with complex redirects, your website can be dynamic, and CloudFront works just like a proxy. However, the downside is the cache control which can be tricky. You cannot use invalidation with the existing tools and you have to set separate cache control headers [`s-maxage`](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html) for CloudFront.

To make things simple, I use Amazon S3 with CloudFront.

### Move files to Amazon S3

The easiest way is using [s3_website](https://github.com/laurilehmijoki/s3_website). It can help you to handle gzip, invalidations and redirects.

Here's a part of my `s3_website.yml` config:

```yaml
s3_bucket: sparanoid.com
max_age:
  "*.css":   31536000
  "*.js":    31536000
  "*.woff2": 31536000
  "*": 300
```

You can also define the files to be ignored:

```
exclude_from_upload:
  - (?:\.(?:DS_Store|bak|config|sql|fla|psd|ai|sketch|ini|log|sh|inc|swp|dist))$
```

For more information please refer `s3_website`'s [documentation](http://github.com/laurilehmijoki/s3_website).

### Fixing wrong feed URL

As discussed before, you cannot use `/feed/` (`/feed/index.xml`) as your feed URL because you can set only one Document Index per bucket. Amazon S3 does not redirect it to a file other than Document Index (i.e. `index.html`). You have to make a redirect from `/feed/` or `/rss/` to `feed.xml` or `rss.xml` that directly points to the file. This is performed by the following two steps:

First redirect `/feed` to `/feed.xml` in `s3_website.yml`:

```yaml
redirects:
  feed: feed.xml
```

Then redirect `/feed/` to `/feed.xml` in AWS web console:

```xml
<RoutingRules>
    <RoutingRule>
        <Condition>
            <KeyPrefixEquals>feed/</KeyPrefixEquals>
        </Condition>
        <Redirect>
            <HostName>sparanoid.com</HostName>
            <ReplaceKeyPrefixWith>feed.xml</ReplaceKeyPrefixWith>
        </Redirect>
    </RoutingRule>
</RoutingRules>
```

### Redirect www to non-www

You have to create an empty separate S3 bucket and redirect all requests to your root domain. Refer [official documentation](http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html#root-domain-walkthrough-s3-tasks). This can be set under your bucket properties panel.

### Enable CloudFront

The only thing you should be aware of is that the Origin Domain Name should be pointing to your S3 endpoint and not to the bucket URL.

### CloudFront + Custom SSL

Amazon has a [very detailed documentation](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html) about using HTTPS with custom SSL certificates and it's hard to get the key points. So here's a brief answer:

```bash
$ aws iam upload-server-certificate --server-certificate-name sparanoid.com --certificate-body file:///path/cert.crt --private-key file:///path/private.key.pem --certificate-chain file:///path/intermediates.chained.crt --path /cloudfront/prod/
```

Please note that `private-key` should be in PEM format. If you get the following error:

> A client error (MalformedCertificate) occurred when calling the UploadServerCertificate operation: Unable to parse certificate. Please ensure the certificate is in PEM format.

Then try:

```bash
$ openssl rsa -in private.key -out private.key.pem
```

If you get the following message, then it must be something wrong with your chained intermediate certificates:

> A client error (MalformedCertificate) occurred when calling the UploadServerCertificate operation: Unable to validate certificate chain. The certificate chain must start with the immediate signing certificate, followed by any intermediaries in order. The index within the chain of the invalid certificate is: 1

The fix is simple - you should only chain your intermediate certificates **without** the domain certificate and this is different with the Nginx `ssl_certificate` directive:

```bash
$ cat COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt > intermediates.chained.crt
```

Please also note that all certs should start with `file://` protocol if they're on your local machine.

If everything is right you will get the following response:

```json
{
    "ServerCertificateMetadata": {
        "ServerCertificateId": "ASCAxxxxxxxxxxxxxxZ7S",
        "ServerCertificateName": "sparanoid.com",
        "Expiration": "2018-04-26T23:59:59Z",
        "Path": "/cloudfront/prod/",
        "Arn": "arn:aws:iam::677998837349:server-certificate/cloudfront/prod/sparanoid.com",
        "UploadDate": "2015-04-27T03:54:45.807Z"
    }
}
```

Then you can enable the Custom SSL Certificate stored in your AWS IAM from the web console.