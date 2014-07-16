---
layout: post
title: Welcome to Almace Scaffolding
category: note
---

`amsf`, a.k.a. **Almace Scaffolding**, a sleek and super-fast responsive theme with only one HTTP request, LESS auto-compile, prefix-free, HTML minification, inlined stylesheets and more. Available for Jekyll right now (will be available for more platforms in the future).

View documentation and learn more on [GitHub](https://github.com/sparanoid/almace-scaffolding).

### Features

- Fully configured Jekyll setup with well-defined [Atom feed](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/feed-atom.xml), [sitemap](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/sitemap.xml)
- A sleek responsive theme, a variant of [sparanoid.com](http://sparanoid.com/), and every minified page generates only one HTTP request [^1]
- (Maybe) [the first](https://github.com/sparanoid/sparanoid.com/commit/9b44b4c0f57c3dd1e828d828a95cc21b992785ce) template that uses [viewport relative units](http://www.w3.org/TR/css3-values/#viewport-relative-lengths)
- [Tons of configurable settings](https://github.com/sparanoid/almace-scaffolding/blob/master/_config.init.yml) for your posts and site customization
- [Handcrafted stylesheets](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/assets/_less/app.less). No Bootstrap or other bloated frameworks are used, CSS < 12 KB (Unminified)
- Theme color scheme, Pygments code highlighting, [Twitter Cards](https://dev.twitter.com/docs/cards), tables, footnotes, GFM, smart quotes are also supported
- Built with Grunt.js for easy development

[^1]: Only when your posts don’t have fancy sliders or other external media files.

### Setup

```sh
$ git clone git@github.com:sparanoid/almace-scaffolding.git
$ bundle install && npm install
$ cp _config.init.yml _config.yml
$ grunt serve
```

You can go to the [GitHub repository]() for detailed setup instructions.

### Download

Go to the [GitHub repository](https://github.com/sparanoid/almace-scaffolding) for documentation, downloads, bug reports, and feature requests.
