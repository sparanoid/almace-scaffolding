# Almace Scaffolding
[![devDependency Status](https://david-dm.org/sparanoid/almace-scaffolding/dev-status.svg)](https://david-dm.org/sparanoid/almace-scaffolding#info=devDependencies)
[![Demo Available](https://img.shields.io/badge/demo-available-brightgreen.svg)](#demo)

`amsf`, a.k.a. **Almace Scaffolding**, a super-fast responsive theme with only one HTTP request, LESS auto-compile, prefix-free, HTML minification, inlined stylesheets and more. Available for [Jekyll](http://jekyllrb.com/) right now (will be available for more platforms in the future).

-----

## Table of Contents

- [Quick Start](#quick-start)
- [Upgrading](#upgrading)
- [Customizing](#customizing)
- [Managing Media](#managing-media)
- [Advanced Usages](#advanced-usages)
- [Avaiable Styles](#avaiable-styles)
  - [`.note`, `.store`, and `.download`](#note-store-and-download)
  - [`.browser`](#browser)
  - [`.largetype`](#largetype)
- [Tips](#tips)
- [Demo](#demo)
- [GitHub Pages Setup Guide](#github-pages-setup-guide)
  - [The Problem](#the-problem)
  - [The Solution](#the-solution)
- [Other Notes](#other-notes)
- [Donate](#donate)
- [Author](#author)
- [Licenses](#licenses)

## Quick Start

1. [Fork](https://github.com/sparanoid/almace-scaffolding/fork) or clone the repo: `git clone git@github.com:sparanoid/almace-scaffolding.git`.
2. Install dependencies with Ruby gem [`bundler`](http://bundler.io/) and Node.js package manager [`npm`](https://www.npmjs.org/): `bundle install && npm install`.
3. Copy `_config.init.yml` to `_config.yml` as your default configuration file.
3. Run `grunt serve` and then open `http://localhost:4321` in your browser.

So in short for geeks:

```sh
$ git clone git@github.com:sparanoid/almace-scaffolding.git
$ bundle install && npm install
$ cp _config.init.yml _config.yml
$ grunt serve
```

Still can't get things working? Why not try my [video tutorials](http://www.youtube.com/watch?v=5NV6Rdv1a3I).

## Upgrading

Upgrading templates is hard, it will be easy if you are're a casual blogger and keep every template file untouched. Just copy and paste all template files in `_assets`, `_includes`, and `_layouts`. If you change the templates directly, you have to compare them side to side.

## Customizing

- All custom settings can be configured at `_config.yml` (a copy of [`_config.init.yml`](_config.init.yml) you just duplicated since your first setup), it's well commented so you should really check it out.
- Additional variables are stored in [`./_app/_data/`](/_app/_data) directory. They can be accessed by Jekyll. ([More info](http://jekyllrb.com/docs/datafiles/))
- Customize your site's look and fell by changing [`./_app/assets/_less/custom.less`](/_app/assets/_less/custom.less).
- Use your custom JavaScript snippets (Google Analytics, Typekit, etc.) in [`./_app/_includes/js.html`](/_app/_includes/js.html).
- You should also change `favicon.ico` and `apple-touch-icon.png` to yours.
- You can add Travis support for this project, simplly rename [`.travis.init.yml`](.travis.init.yml) to `.travis.yml`.
- Some tasks in `Gruntfile.coffee` are not used in this project, they're copied from my own [website](https://github.com/sparanoid/sparanoid.com), I'll keep them untouched in case you need these.

## Managing Media

Media files are located in `./assets/` and grouped by different formats:

- `./_js/`: JavaScript files, put all needed sctipts in this directoy will just work fine. All files in this directory will be automatically uglified and copied into `./js/`. I don't expect to have many scripts so no complex `vender`, `lib`, or other fancy structures used for this project.
- `./_less/`: LESS stylesheets, the leading underscore makes sure this directory is excluded from Jekyll generated site.
- `./css/`:  CSS and its sourcemap files generated from LESS, it's gitignored.
- `./font/`: Web fonts
- `./img/`: Image assets, images used by template, personally I don't recommend put post images here, use a CDN instead.
- `./svg/`: The same as `./img/`.

## Advanced Usages

- [Markup Example](http://sparanoid.com/lab/amsf/markup-example.html)
- [SVG Post Ttile](http://sparanoid.com/lab/amsf/svg-post-title.html)
- [Unique Post Styling via Custom CSS](http://sparanoid.com/lab/amsf/custom-css.html)
- [Custom Color Scheme](http://sparanoid.com/lab/amsf/custom-color-scheme.html)
- [External Link Post](http://sparanoid.com/lab/amsf/external-link-post.html)

## Avaiable Styles

I've written some useful CSS classes for you, see below:

### `.note`, `.store`, and `.download`

A paragraph block with a thin border line.

Usage:

```html
<p class=download>
  <a href="https://github.com/sparanoid/sparanoid.com/">Download</a> it from GitHub
</p>

<p class=store>
  Love this plugin? please consider <a href="{{ site.profile.donate }}">buying me a cup of coffee.</a>
</p>
```

### `.browser`

A simple browser frame using pure CSS.

Usage:

```html
<p class=browser>
  <img src="/delicious.com-homepage.png" alt="Delicious Landing Page">
</p>
```

### `.largetype`

Make normal paragraph text large enough.

Usage:

```html
<p class=largetype>
  <a href="{{ site.profile.donate }}">PayPal</a>
</p>
```

## Tips

- Not familer with [Markdown](http://daringfireball.net/projects/markdown/)? Try [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
- You can use Jekyll's [built-in syntax highlighting](http://jekyllrb.com/docs/templates/#code_snippet_highlighting), I've included a default theme for this project.
- [Tables](https://help.github.com/articles/github-flavored-markdown#tables) and [footnotes](https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use) are also avaiables to use.

## Demo

Live demo available at [amsf.github.io](http://amsf.github.io/)

You can also see a more complex live demo using this framework at [my site](http://sparanoid.com/).

## GitHub Pages Setup Guide

### The Problem

Unfortunately this project doesn't work with GitHub Pages or GitHub Pages for projects. There're some factors that prevent it from generating pages:

- Many features Almace Scaffolding provides like LESS support, inline SVG, and HTML minification are implemented using [Grunt.js](http://gruntjs.com/), it's not supported by GitHub Pages.
- Almace Scaffolding uses the latest pre-release Jekyll, so not all features are supported by GitHub Pages renderers.
- GItHub Pages build server [overwrites the `source` settings](https://help.github.com/articles/pages-don-t-build-unable-to-run-jekyll#source-setting). This prevent it generating pages from current file structure.

### The Solution

I know this can be tricky and more verbose than uploading your Jekyll site directly to your repository. However GitHub Pages support static HTML pages, a workaround solution for using Almace Scaffolding on GitHub Pages is treating your Jekyll site as static pages:

- Build your site locally (`grunt build`).
- Upload Jekyll generateed static files to your `username.github.io` repository.

If you'd like to keep all things under Git control, you can try the following file structure:

```
├── _amsf/ (Almace Scaffolding source code)
├── *.html (Jekyll-generated static pages)
└── README.md (your own readme)
```

You can see this [live demo](http://github.com/amsf/amsf.github.io/) how to make them friends.

## Other Notes

- `_config.yml` is git ignored from `.git/info/exclude` file

## Donate

Wanna buy me a cup of coffee? [Great](http://sparanoid.com/donate/).

## Author

**Tunghsiao Liu**

- Twitter: @[tunghsiao](http://twitter.com/tunghsiao)
- GitHub: @[sparanoid](http://github.com/sparanoid)

## Licenses

Following files, directories and their contents are copyright Tunghsiao Liu and licensed under a [CC BY-NC-ND 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0/). You may not reuse anything therein without permission:

- `./_app/_posts/`
- `./_app/apple-touch-icon.png`
- `./_app/favicon.ico`

All other files and directories are licensed under the [MIT](http://www.opensource.org/licenses/mit-license.php) unless explicitly stated.

© Tunghsiao Liu. Rights reserved as indicated above.
