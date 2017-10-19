---
layout: post
title: Getting Started
category: note
tags:
  - 1. Getting Started
---

## Requirements

Almace Scaffolding has exactly the same requirements as Jekyll. For more info please refer to [Installation - Jekyll](http://jekyllrb.com/docs/installation/).

## Quick Start

1. [Fork](https://github.com/sparanoid/almace-scaffolding/fork) or clone the repo.
2. Install dependencies with Ruby gem [`bundler`](http://bundler.io/) and Node.js package manager [`npm`](https://www.npmjs.org/).
3. Run `grunt init` to initialize your project.
3. Run `grunt serve` to fire up a local server.

So in short for geeks:

```sh
$ git clone git@github.com:sparanoid/almace-scaffolding.git
$ bundle install && npm install
$ grunt init
$ grunt serve
```

## Download

Go to the [GitHub repository](https://github.com/sparanoid/almace-scaffolding) for downloads, bug reports, and feature requests.

## Transfer from Jekyll

You can simply copy all posts from your old Jekyll setup into `_app/_posts`, you can also transfer your custom pages into `_app/_pages/`.

## Upgrading

It will be easy if you're a casual blogger and keep every core and template file untouched. You can use the following command to update Almace Scaffolding core files:

```sh
$ grunt amsf-update
```

It checks the latest Almace Scaffolding build from GitHub and update core files automatically. Please keep in mind that if you changed some of the AMSF core files this action will **override** the changes you made. So it's recommended to keep your project under version control, you will be always be able to compare changes for Almace Scaffolding.

## Using Beta Release

By default, when you run `amsf-update` you will get updated files from `release` branch. However, I'm continuously working on Almace Scaffolding, so there may have testing branches you can try and give me feedback if you're interested. You can check the AMSF GitHub repository for available branches, and it's very easy to switch:

```sh
$ grunt amsf-update --branch=feat/service-worker
```

The branch `master` is the one which is always available to checkout and also has the latest changes:

```sh
$ grunt amsf-update --branch=master
```

If you messed up with the testing branch, don't worry, you can just run a normal update to revert them back:

```sh
$ grunt amsf-update
```
