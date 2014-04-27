# Jekyll Scaffolding
[![Build Status](https://travis-ci.org/sparanoid/jekyll-scaffolding.png)](https://travis-ci.org/sparanoid/jekyll-scaffolding)
[![devDependency Status](https://david-dm.org/sparanoid/jekyll-scaffolding/dev-status.png)](https://david-dm.org/sparanoid/jekyll-scaffolding#info=devDependencies)

`jksf`, a.k.a. **Jekyll Scaffolding**, a sleek and super-fast responsive theme with only one HTTP request, LESS auto-compile, prefix-free, HTML minification, inlined stylesheets and more.

## Feature

- **Jekyll Scaffolding** ships a sleek responsive theme, a variant of [sparanoid.com](http://sparanoid.com/)
- Every minified page generates only one HTTP request *
- Minimalism design, No jQuery library, No JavaScript, No `everybody-shake-ur-body.js`
- (Maybe) the first template that uses [viewport relative units](http://www.w3.org/TR/css3-values/#viewport-relative-lengths)
- No Bootstrap or other bloated frameworks are used, CSS < 9 KB
- Predefined LESS variables make it easier to change color schemes for different posts
- Ideal for personal blog, portfolio, product blog and Tumblr-like link blog
- Well-defined Atom feed template
- No Internet Explorer support
- Built with Grunt.js
  - Styling with LESS, CSS file is automatically compiled on the fly
  - CSS prefix-free
  - HTML, CSS, and XML minification
  - Assets files revving

*: Well, only when your posts don’t have fancy sliders or other external media files.

## Setup

1. [Fork](https://github.com/sparanoid/jekyll-scaffolding/fork) this project, checkout to your local machine.
2. Run `bundle install && npm install` to install required dependencies. Ruby gem `bundler` and Node.js package manager `npm` must be installed before running this command.
3. Run `grunt serve` to fire up a server on your localhost, then open `http://localhost:4321` in your browser.
4. Edit, edit, delete, delete, commit, push, done.

## Setup Notes

- Additional variables are stored in `./_app/_data/` directory. They can be accessed by Jekyll. ([More info](http://jekyllrb.com/docs/datafiles/))
- You should also change `favicon.ico` and `apple-touch-icon.png` to yours.
- Customize your site using `custom.less`.
- Some tasks in `Gruntfile.coffee` are not used in this project, they're copied from my own [website](https://github.com/sparanoid/sparanoid.com), I'll keep them untouched in case you need these.
- Please keep the credits in template file, thanks.

## Manage Media

Media files are located in `./assets/` and grouped by different formats:

- `./_less/`: LESS stylesheets, the leading underscore makes sure this directory is excluded from Jekyll generated site.
- `./css/`:  CSS and its sourcemap files generated from LESS, it's gitignored.
- `./font/`: Web fonts
- `./img/`: Image assets, images used by template, personally I don't recommend put post images here, use a CDN instead.
- `./js/`: JavaScript files, put all needed sctipts in this directoy will just work fine. I don't expect to have many scripts so no complex `vender`, `lib`, or other fancy structures used for this project.
- `./svg/`: The same as `./img/`.

## Avaiable Styles, Scripts, and Tips

Not familer with [Markdown](http://daringfireball.net/projects/markdown/)? Try [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

- You can use Jekyll's [built-in syntax highlighting](http://jekyllrb.com/docs/templates/#code_snippet_highlighting), I've included a default theme for this project
- [Tables](https://help.github.com/articles/github-flavored-markdown#tables) and [footnotes](https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use) are also avaiables to use
- I've written some useful CSS classes for you, see below:

### `.note`, `.store`, and `.download`

A paragraph block with a thin border line

Useage:

```html
<p class=download><a href="https://github.com/sparanoid/sparanoid.com/">Download</a> it from GitHub</p>
<p class=store>Love this plugin? please consider <a href="{{ site.data.var.donate }}">buying me a cup of coffee.</a></p>
```

### `.browser`

WIP

### `.margin-fix`

WIP

### `.largetype`

WIP

### `.flexslider`

WIP

## Demo

<img src="https://raw.github.com/sparanoid/rsrc/jekyll-scaffolding/jekyll-scaffolding-01.png" alt="Jekyll Scaffolding Preview">

<img src="https://raw.github.com/sparanoid/rsrc/jekyll-scaffolding/jekyll-scaffolding-02.png" alt="Jekyll Scaffolding Preview">

<img src="https://raw.github.com/sparanoid/rsrc/jekyll-scaffolding/jekyll-scaffolding-03.png" alt="Jekyll Scaffolding Preview">

<img src="https://raw.github.com/sparanoid/rsrc/jekyll-scaffolding/jekyll-scaffolding-04.png" alt="Jekyll Scaffolding Preview" width="414">

You can see a more complex live demo using this framework at [my site](http://sparanoid.com/).

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
