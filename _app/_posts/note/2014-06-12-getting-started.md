---
layout: post
title: Getting Started
category: note
---

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

## Download

Go to the [GitHub repository](https://github.com/sparanoid/almace-scaffolding) for downloads, bug reports, and feature requests.

## Upgrading

Upgrading templates is hard, it will be easy if you are're a casual blogger and keep every template file untouched. Just copy and paste all template files in `_assets`, `_includes`, and `_layouts`. If you change the templates directly, you have to compare them side to side.

## Customizing

- All custom settings can be configured at `_config.yml` (a copy of [`_config.init.yml`](https://github.com/sparanoid/almace-scaffolding/blob/master/_config.init.yml) you just duplicated since your first setup), it's well commented so you should really check it out.
- Additional variables are stored in [`./_app/_data/`](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/_data) directory. They can be accessed by Jekyll. ([More info](http://jekyllrb.com/docs/datafiles/))
- Customize your site's look and fell by changing [`./_app/assets/_less/custom.less`](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/assets/_less/custom.less).
- Use your custom JavaScript snippets (Google Analytics, Typekit, etc.) in [`./_app/_includes/js.html`](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/_includes/js.html).
- You should also change `favicon.ico` and `apple-touch-icon.png` to yours.
- You can add Travis support for this project, simplly rename [`.travis.init.yml`](https://github.com/sparanoid/almace-scaffolding/blob/master/.travis.init.yml) to `.travis.yml`.
- Some tasks in `Gruntfile.coffee` are not used in this project, they're copied from my own [website](https://github.com/sparanoid/sparanoid.com), I'll keep them untouched in case you need these.

## Managing Media

Media files are located in `/_app/assets/` and grouped by different formats:

- `_js/`: JavaScript files, put all needed sctipts in this directoy will just work fine. All files in this directory will be automatically uglified and copied into `js/`. I don't expect to have many scripts so no complex "vender", "lib", or other fancy structures used for this project.
- `_less/`: LESS stylesheets, the leading underscore makes sure this directory is excluded from Jekyll generated site.
- `css/`:  CSS and its sourcemap files generated from LESS, it's gitignored.
- `font/`: Web fonts
- `img/`: Image assets, images used by template, personally I don't recommend put post images here, use a CDN instead.
- `svg/`: The same as `img/`.

## Advanced Usages

- [Markup Example](http://sparanoid.com/lab/amsf/markup-example.html)
- [Custom HTML Markups](http://sparanoid.com/lab/amsf/custom-html-markups.html)
- [Custom Color Scheme](http://sparanoid.com/lab/amsf/custom-color-scheme.html)
- [Unique Post Styling via Custom CSS](http://sparanoid.com/lab/amsf/custom-css.html)
- [SVG Post Ttile](http://sparanoid.com/lab/amsf/svg-post-title.html)
- [External Link Post](http://sparanoid.com/lab/amsf/external-link-post.html)
- [GitHub Pages Setup Guide](http://sparanoid.com/lab/amsf/github-pages-setup.html)

## Tips

- Not familer with [Markdown](http://daringfireball.net/projects/markdown/)? Try [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
- You can use Jekyll's [built-in syntax highlighting](http://jekyllrb.com/docs/templates/#code_snippet_highlighting), I've included a default theme for this project.
- [Tables](https://help.github.com/articles/github-flavored-markdown#tables) and [footnotes](https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use) are also avaiables to use.

## Other Notes

- `_config.yml` is git ignored from `.git/info/exclude` file
