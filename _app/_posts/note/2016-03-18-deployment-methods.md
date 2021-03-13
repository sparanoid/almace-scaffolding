---
layout: post
title: Deployment Methods
category: note
tags: deployment
---

Sites generated using Almace Scaffolding can be deployed in nearly any web hosting services. A few of the most common deployment techniques are described below. More deployment methods please refer to [Jekyll - Deployment methods](https://jekyllrb.com/docs/deployment-methods/).

## Cloudflare Pages

The simplest way to deploy your AMSF site is using [Cloudflare Pages](https://pages.cloudflare.com/). Just signup for Cloudflare and connect it with your GitHub account. Create a Pages project and use the following settings:

- Framework preset: Jekyll
- Build command: `grunt build`
- Build output directory: `_site`

## Web Hosting Providers (FTP/SFTP)

Just about any traditional web hosting provider will let you upload files to their servers over FTP. You can simply run the `grunt build` command and upload all files generated under `_site` to the HTTP root folder of your hosting account.

## rsync

There's a `_deploy.yml` at the root of your AMSF project containing a basic `rsync` configurations. Change these configurations to yours and then run:

```bash
$ grunt deploy:rsync
```

You can deploy it for specific environments, the following command will deploy your site to `beta` environment via `rsync` method you defined in `_deploy.yml`:

```bash
$ grunt deploy:rsync --env=beta
```

## Amazon S3 (s3_website)

You can also deploy your site to Amazon S3 via [s3_website](https://github.com/laurilehmijoki/s3_website), see `s3_website.example.yml` for more info.
