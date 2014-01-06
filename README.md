# Jekyll Scaffolding
[![Build Status](https://travis-ci.org/sparanoid/jekyll-scaffolding.png)](https://travis-ci.org/sparanoid/jekyll-scaffolding)
[![devDependency Status](https://david-dm.org/sparanoid/jekyll-scaffolding/dev-status.png)](https://david-dm.org/sparanoid/jekyll-scaffolding#info=devDependencies)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sparanoid/jekyll-scaffolding/trend.png)](https://bitdeli.com/free)

Jekyll Scaffolding with sleek default theme MFEO, LESS auto-compile, prefix-free.

## Feature

- A sleek default theme, codename `MFEO`, a variant of sparanoid.com
  - Mobile-friendly, works great on your iPhone and iPad
  - Minimalism design, No jQuery library, No JavaScript
    - It only generates two HTTP requests (well, only if your posts don't have external media files)
  - Work smooth for personal blog, portfolio, product blog and Tumblr-like link blog
  - HTTP error page
  - Atom feed template
  - No Internet Explorer support
- Built with Grunt.js
  - Styling with LESS, CSS file is automatically compiled on the fly
  - CSS prefix-free
  - HTML, CSS, and XML minification
  - Assets files revving

## Setup

1. [https://github.com/sparanoid/jekyll-scaffolding/fork](Fork) this project.
2. Checkout to your local machine.
3. Run `bundle install && npm install` to install required dependencies. Ruby gem `bundler` and Node.js package manager `npm` must be installed before running this command.
4. Run `grunt server` to fire up a server on your localhost.
5. Open `http://localhost:4321` in your browser.
6. Edit, edit, delete, delete, commit, push, done.

## Demo

You can see a more complex setup using this framework at [my site](https://github.com/sparanoid/sparanoid.com).

## Author

**Tunghsiao Liu**

- Twitter: @[tunghsiao](http://twitter.com/tunghsiao)
- GitHub: @[sparanoid](http://github.com/sparanoid)

## Licenses

Following files, directories and their contents are copyright Tunghsiao Liu and licensed under a [CC BY-NC-ND 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0/). You may not reuse anything therein without permission:

- `_/source/_posts/`
- `_/source/apple-touch-icon-precomposed.png`
- `_/source/favicon.ico`

All other files and directories are licensed under the [MIT](http://www.opensource.org/licenses/mit-license.php) unless explicitly stated.

Copyright (c) Tunghsiao Liu. Rights reserved as indicated above.
