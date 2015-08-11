---
layout: post
title: Getting Started
category: note
---

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

## Customizing

- All AMSF built-in settings can be configured at [`_config.yml`](https://github.com/sparanoid/almace-scaffolding/blob/master/_config.yml).
- Theme specific variables can be found at `./_app/_data/theme-name.yml`.
- Additional variables are stored in [`./_app/_data/`](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/_data) directory. They can be accessed by Jekyll. ([More info](http://jekyllrb.com/docs/datafiles/))
- You should also change `favicon.ico` and `apple-touch-icon.png` to yours.
- Some tasks in `Gruntfile.coffee` are not used in this project, they're copied from my own [website](https://github.com/sparanoid/sparanoid.com), I'll keep them untouched in case you need these.
- More customization please refer to theme specific documentation

## Advanced Usages

- [Themes](http://sparanoid.com/lab/amsf/themes.html)
- [Markup Example](http://sparanoid.com/lab/amsf/markup-example.html)
- [Custom HTML Markups](http://sparanoid.com/lab/amsf/custom-html-markups.html)
- [Custom Color Scheme](http://sparanoid.com/lab/amsf/custom-color-scheme.html)
- [Unique Post Styling via Custom CSS](http://sparanoid.com/lab/amsf/custom-css.html)
- [SVG Post Ttile](http://sparanoid.com/lab/amsf/svg-post-title.html)
- [External Link Post](http://sparanoid.com/lab/amsf/external-link-post.html)
- [GitHub Pages Setup Guide](http://sparanoid.com/lab/amsf/github-pages-setup.html)

## Tips

- Not familer with [Markdown](http://daringfireball.net/projects/markdown/)? Try [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
- You can use Jekyll's [built-in syntax highlighting](http://jekyllrb.com/docs/templates/#code-snippet-highlighting), I've included a default theme for this project.
- [Tables](https://help.github.com/articles/github-flavored-markdown#tables) and [footnotes](https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use) are also avaiables to use.
