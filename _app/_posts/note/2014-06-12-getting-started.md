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

## Upgrading

Upgrading templates is hard, it will be easy if you are're a casual blogger and keep every core and template file untouched. Just copy and paste all files (except your `_app/_posts` and `_app/_pages`) to `_app`. If you change the core files and templates directly, you have to compare them side by side.

If you're using a custom theme, use `grunt theme-save` to backup your theme before updating and use `grunt theme-upgrade` for restoring. See [Themes](http://sparanoid.com/lab/amsf/themes.html) for more info.
