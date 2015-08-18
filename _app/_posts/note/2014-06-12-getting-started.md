---
layout: post
title: Getting Started
category: note
tag: getting-started
---

## Requirements

Almace Scaffolding has exactly the same requirements as Jekyll. For more info please refer to [Installation - Jekyll](http://jekyllrb.com/docs/installation/).

## Quick Start

1. [Fork](https://github.com/sparanoid/almace-scaffolding/fork) or clone the repo.
2. Make sure you have [Grunt](http://gruntjs.com/) and [Browsersync](http://www.browsersync.io/) installed.
3. Install dependencies with Ruby gem [`bundler`](http://bundler.io/) and Node.js package manager [`npm`](https://www.npmjs.org/).
5. Run `grunt serve`.

So in short for geeks:

```sh
$ git clone git@github.com:sparanoid/almace-scaffolding.git
$ npm install -g grunt-cli browser-sync
$ bundle install && npm install
$ grunt serve
```

## Download

Go to the [GitHub repository](https://github.com/sparanoid/almace-scaffolding) for downloads, bug reports, and feature requests.

## Transfer from Jekyll

You can simply copy all posts from your old Jekyll setup into `_app/_posts`, you can also transfer your custom pages into `_app/_pages/`.

## Upgrading

Upgrading templates is hard, it will be easy if you are're a casual blogger and keep every core and template file untouched. You can use the following command to update Almace Scaffolding core files:

```sh
$ grunt amsf-update
```

It checks the latest Almace Scaffolding build from GitHub and update core files automatically. Please keep in mind that if you changed some of the AMSF core files this action will **override** the changes you made. So it's recommended to keep your project under version control, you will be always be able to compare changes for Almace Scaffolding.
