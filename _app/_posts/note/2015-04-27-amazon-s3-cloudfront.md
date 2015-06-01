---
layout: post
title: Amazon S3 × CloudFront
category: note
---

Previously this site is hosted on a Linode VPS, handing thousands requests a day. It's stable, fast, it also has a great support team. But this time I'd like to try something new: host my website entirely in the cloud.

The first cloud provider came to my mind is Amazon S3 and CloudFront. back to the 2010 I tried this combination with no luck. The web hosting feature of S3 was a crap, CloudFront didn't support custom domain SSL and apex (root) domain was also unsupported. But now I'm happy to see all these features have been implemented, so let me try this approach again.

Please note that this is not a details tutorial about how to host your website to Amazon S3 and CloudFront, but my personal notes about setup pitfalls.

### Transfer everything to the Cloud?

There're two methods you can choose: host static files on Amazon S3, speed up using CloudFront, or host your website on a remote server, using CloudFront as custom origin proxy. Both of them have pros and cons:

Amazon S3 + CloudFront means you don't have to buy additional servers to host your website but you have to do more work to make sure your website behaves the same as before. For example you can't use `/feed/` (`/feed/index.xml`) as your feed URL because you can set only one Document Index per bucket. If you're using `/feed/` you have to redirect it to something like `feed.xml`. gzip is also not a native feature on S3, you have to compress it manually or using other tools (I'll talk about it later).

Using Amazon CloudFront with custom origin means you still need servers to store your files, you'll have more control with your website, for example you can use Nginx with complex redirects, your website can also be dynamic, CloudFront just works like a proxy. However the downside is cache control can be tricky, you can't use invalidation easily with existing tools, so you have to set separate cache control headers [`s-maxage`](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html) for CloudFront.

To make things simple, I use Amazon S3 with CloudFront.

### Move files to Amazon S3

The easiest way is using [s3_website](https://github.com/laurilehmijoki/s3_website). It can help you handle gzip, invalidations and redirects.

Here's part of my `s3_website.yml` config:

```yaml
s3_bucket: sparanoid.com
max_age:
  "*.css":   31536000
  "*.js":    31536000
  "*.woff2": 31536000
  "*": 300
```

You can also define which files to be ignored:

```
exclude_from_upload:
  - (?:\.(?:DS_Store|bak|config|sql|fla|psd|ai|sketch|ini|log|sh|inc|swp|dist))$
```

More information you should see `s3_website`'s [documentation](http://github.com/laurilehmijoki/s3_website).

### Fixing wrong feed URL

As I said before, you can't use `/feed/` (`/feed/index.xml`) as your feed URL because you can set only one Document Index per bucket. Amazon S3 won't redirect it to file other than Document Index (i.e. `index.html`). You have to make a redirect from `/feed/` or `/rss/` to `feed.xml` or `rss.xml` that directly points to the file. Usually it takes two steps:

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

You have to create an empty separate S3 bucket and redirect all requests to your root domain. See [official documentation](http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html#root-domain-walkthrough-s3-tasks). This can be set under your bucket properties panel.

### Enable CloudFront

The only thing you should be aware is Origin Domain Name should be pointed to your S3 endpoint, not the bucket URL.

### CloudFront + Custom SSL

Amazon has a [very detailed documentation](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html) about using HTTPS with custom SSL certificates, it's hard to get the key points so here's a short answer:

```bash
$ aws iam upload-server-certificate --server-certificate-name sparanoid.com --certificate-body file:///path/cert.crt --private-key file:///path/private.key.pem --certificate-chain file:///path/intermediates.chained.crt --path /cloudfront/prod/
```

Please note that `private-key` should be in PEM format, if you get the following error:

> A client error (MalformedCertificate) occurred when calling the UploadServerCertificate operation: Unable to parse certificate. Please ensure the certificate is in PEM format.

Then try:

```bash
$ openssl rsa -in private.key -out private.key.pem
```

If you get the following message, it must be something wrong with your chained intermediate certificates:

> A client error (MalformedCertificate) occurred when calling the UploadServerCertificate operation: Unable to validate certificate chain. The certificate chain must start with the immediate signing certificate, followed by any intermediaries in order. The index within the chain of the invalid certificate is: 1

The fix is simple, you should only chain your intermediate certificates **without** the domain certificate, this is different with the Nginx `ssl_certificate` directive:

```bash
$ cat COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt > intermediates.chained.crt
```

Please also note that all certs should start with `file://` protocol if they're on your local machine.

If everything is right you'll get the following response:

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

Then you can enable Custom SSL Certificate stored in your AWS IAM from the web console.
