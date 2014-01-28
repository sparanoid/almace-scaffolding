# Jekyll Scaffolding
[![Build Status](https://travis-ci.org/sparanoid/jekyll-scaffolding.png)](https://travis-ci.org/sparanoid/jekyll-scaffolding)
[![devDependency Status](https://david-dm.org/sparanoid/jekyll-scaffolding/dev-status.png)](https://david-dm.org/sparanoid/jekyll-scaffolding#info=devDependencies)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/sparanoid/jekyll-scaffolding/trend.png)](https://bitdeli.com/free)

Jekyll Scaffolding with sleek default theme, LESS auto-compile, prefix-free, HTML minification and more.

## Feature

- A sleek default theme, codename `MFEO`, a variant of [sparanoid.com](http://sparanoid.com/)
  - Mobile-friendly, works great on your iPhone and iPad
  - Minimalism design, No jQuery library, No JavaScript
    - It generates only two HTTP requests (well, only if your posts don't have external media files)
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

1. [Fork](https://github.com/sparanoid/jekyll-scaffolding/fork) this project.
2. Checkout to your local machine.
3. Run `bundle install && npm install` to install required dependencies. Ruby gem `bundler` and Node.js package manager `npm` must be installed before running this command.
4. Run `grunt server` to fire up a server on your localhost.
5. Open `http://localhost:4321` in your browser.
6. Edit, edit, delete, delete, commit, push, done.

## Setup Notes

- Additional variables are stored in `./_app/_data/` directory. They can be accessed by Jekyll. ([More info](http://jekyllrb.com/docs/datafiles/))
- You should change the URLs and other variables in `package.json` according to yours.
- You should also change `favicon.ico` and `apple-touch-icon-precomposed.png` to yours.
- Some tasks in `Gruntfile.coffee` are not used in this project, they're copied from my own [website](https://github.com/sparanoid/sparanoid.com), I'll keep them untouched in case you need these.
- Please keep the credit in template file, thanks.

## Demo

<img src="https://raw.github.com/sparanoid/rsrc/jekyll-scaffolding/01-jekyll-scaffolding.png" alt="Jekyll Scaffolding Preview">

You can see a more complex setup using this framework at [my site](https://github.com/sparanoid/sparanoid.com).

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

Copyright (c) Tunghsiao Liu. Rights reserved as indicated above.
