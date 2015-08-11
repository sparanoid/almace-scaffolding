---
layout: post
title: Welcome to Almace Scaffolding
category: note
---

`amsf`, a.k.a. **Almace Scaffolding**, a super-fast Jekyll framework, supports live reloading (Browsersync), LESS, HTML minification, inlined stylesheets and more. Available for [Jekyll](http://jekyllrb.com/) right now (will be available for more platforms in the future).

<p class=largetype>
  <a href="http://sparanoid.com/lab/amsf/getting-started.html">Getting Started</a>
</p>

Go to the [GitHub](https://github.com/sparanoid/almace-scaffolding) page for downloads, bug reports, and feature requests.

## Features

- Theme switching, you can switch themes with just one command
- A basic, fully configured Jekyll setup with well-defined [Atom feed](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/feed-atom.xml), [sitemap](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/sitemap.xml), and [Twitter Cards](https://dev.twitter.com/docs/cards) support
- **Almace Scaffolding** ships a sleek responsive theme [Curtana](https://github.com/sparanoid/amsf-curtana), a variant of [sparanoid.com](http://sparanoid.com/), looking great on any mordern browsers
- Every minified page generates only one HTTP request [^1]
- Minimalism design, No jQuery, no `everybody-shake-ur-body.js`
- Ideal for personal blog, portfolio, product blog and Tumblr-like link blog
- (Maybe) [the first](https://github.com/sparanoid/sparanoid.com/commit/9b44b4c0f57c3dd1e828d828a95cc21b992785ce) template that uses [viewport relative units](http://www.w3.org/TR/css3-values/#viewport-relative-lengths)
- [Tons of configurable settings](https://github.com/sparanoid/almace-scaffolding/blob/master/_config.init.yml) for your posts and site customization
- [Handcrafted stylesheets](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/assets/_less/app.less). No Bootstrap or other bloated frameworks are used, unminified CSS < 12 KB
- Predefined LESS variables make it easier to change color schemes for different posts
- [Default stylesheets](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/assets/_less/syntax.less) for Pygments code highlighting
- Redcarpet as Markdown renderer, tables, footnotes, GFM, smart quotes are supported
- Built with Grunt.js for easy development
- No Internet Explorer support

[^1]: Only when your posts don’t have fancy sliders or other external media files.
