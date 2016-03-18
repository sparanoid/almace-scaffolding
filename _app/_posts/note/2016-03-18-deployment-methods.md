---
layout: post
title: Deployment Methods
category: note
tags: deployment
---

Sites generated using Almace Scaffolding can be deployed in nearly any web hosting services. A few of the most common deployment techniques are described below. More deployment methods please refer to [Jekyll - Deployment methods](https://jekyllrb.com/docs/deployment-methods/).

## Web Hosting Providers (FTP/SFTP)

Just about any traditional web hosting provider will let you upload files to their servers over FTP. You can simply run the `grunt build` command and upload all files generated under `_site` to the HTTP root folder of your hosting account.

## rsync

There's a `_deploy.yml` at the root of your AMSF project containing a basic `rsync` configurations. Change these configurations to yours and then run:

```bash
$ grunt --deploy=rsync
```
