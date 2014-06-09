<a name="24.0.8"></a>
### 24.0.8 (2014-06-05)


#### Features

* **post:** update posts for discontinued external links ([744f32f4](http://github.com/sparanoid/sparanoid.com/commit/744f32f46a5052c57bf7bfe272cd238e39fab621))
* **style:** remove obsoleted FlesSlider styles ([fd75b04c](http://github.com/sparanoid/sparanoid.com/commit/fd75b04c0fb6da967da33083aaf0a18045cba0b5))
* **template:** update Atom template ([73c236bf](http://github.com/sparanoid/sparanoid.com/commit/73c236bfabfcdb9f2628ff382ae6b3534c9bedc2))


#### Breaking Changes

* Now you can use `link_blog` and `rss_excerpt` for your Atom feed ([73c236bf](http://github.com/sparanoid/sparanoid.com/commit/73c236bfabfcdb9f2628ff382ae6b3534c9bedc2)):
  - `link_blog`: Enable this settings to make your feed Daring Fireball-like link blog. This basically change your <link> value to external link you defined in your posts.
  - `rss_excerpt`: Use post excerpt instead of full content for RSS feeds, just like WordPress RSS feed output option


<a name="24.0.7"></a>
### 24.0.7 (2014-05-16)


#### Bug Fixes

* **post:** fix post grammar ([d1cdebdd](http://github.com/sparanoid/sparanoid.com/commit/d1cdebdd92a1d38ef81195a21a03346a03b46c1f))
* **style:**
  * fix wrong scoped style use ([79e71de0](http://github.com/sparanoid/sparanoid.com/commit/79e71de08a1be4f7a404c94d8d77889af111497f))
  * avoid line-height override for `jksf` ([d24663fd](http://github.com/sparanoid/sparanoid.com/commit/d24663fddbc4fdac012edd32aab86ad549632d5b))


#### Features

* update apple-touch-icon ([050508b5](http://github.com/sparanoid/sparanoid.com/commit/050508b5aed7553511330650e7d0da629e91607b))
* **grunt:**
  * update `html-minifier`, make all whitespace collapsed to one character. ([93bfb422](http://github.com/sparanoid/sparanoid.com/commit/93bfb4222eeb5e1e5e19b3df2164525b617eee81))
  * better grunt tasks excluding files those need post-process ([bce8cf73](http://github.com/sparanoid/sparanoid.com/commit/bce8cf732f5f691516e04fcc00ab98b904245fac))
* **post:** new post “AVOS Cloud” ([f6ed5f63](http://github.com/sparanoid/sparanoid.com/commit/f6ed5f634fda7209fedee6a4b8a6a3f692b682bf))
* **style:**
  * update status text color ([5a388e1b](http://github.com/sparanoid/sparanoid.com/commit/5a388e1b47123c67994cfcd2cebd9f5c5ed86b10))
  * more viewport unit ([364c5ad1](http://github.com/sparanoid/sparanoid.com/commit/364c5ad1653d01f6e6758205b8ecbe95eed19ee1))
* **template:**
  * make normal image headers responsive ([c5d3a185](http://github.com/sparanoid/sparanoid.com/commit/c5d3a18599fea23650496f1667ff49f6cbbab730))
  * update template variables ([874ccb06](http://github.com/sparanoid/sparanoid.com/commit/874ccb063f99d2625c3fbf0d8b70b833cc73b1e6))
  * remove Alipay donate link ([f42ed071](http://github.com/sparanoid/sparanoid.com/commit/f42ed0716dca40e47a0b2a64d94e99842f5b29dc))
  * better variables structure ([af58b736](http://github.com/sparanoid/sparanoid.com/commit/af58b736e9dab2122519733e0020186819cc747a))
  * remove all FlexSlider instances ([4124d6ad](http://github.com/sparanoid/sparanoid.com/commit/4124d6ada257a79114f22d88e92a62829cecccb1))


#### Breaking Changes

* Now you can have custom CSS styles per post. Simply create a `css` front-matter data like this:

```
css: |
  article header h1 img {
    image-rendering: pixelated;
  }
```
 ([c5d3a185](http://github.com/sparanoid/sparanoid.com/commit/c5d3a18599fea23650496f1667ff49f6cbbab730))


<a name="24.0.6"></a>
### 24.0.6 (2014-04-27)


#### Bug Fixes

* include the missing gem lock file ([2a546df9](http://github.com/sparanoid/sparanoid.com/commit/2a546df94bdeea1ead054ef653627fb9b92a4e2e))
* **style:**
  * avoid smoosh container edge ([75f66dfc](http://github.com/sparanoid/sparanoid.com/commit/75f66dfcfc60ef3e17f26c652a5e9e32006b835f))
  * remove padding reset for last child elements ([62caf45f](http://github.com/sparanoid/sparanoid.com/commit/62caf45fc00132192694a9994a36ba168bf2cf1c))


#### Features

* better external link post indicator ([6393ea07](http://github.com/sparanoid/sparanoid.com/commit/6393ea07d74672599b9cf7dd17ec5a3becb65174))
* **style:** SVG headlines got viewport units support ([f818a7b1](http://github.com/sparanoid/sparanoid.com/commit/f818a7b1d626a4581c4a1d81df06d17d7c9b4dd1))
* **template:**
  * better inline SVG post title support ([6c33d1d6](http://github.com/sparanoid/sparanoid.com/commit/6c33d1d678d9a5228f160bae82be8748c966501a))
  * inline SVG headline support ([89d3dac3](http://github.com/sparanoid/sparanoid.com/commit/89d3dac3413e11e5139cf8c96e2adc490d27ad9a))
  * better Twitter Cards support ([39d5c5e9](http://github.com/sparanoid/sparanoid.com/commit/39d5c5e9670c9bedb32bff8f4c807eb156cc1f8f))


#### Breaking Changes

* Now I dynamically include headline SVG based on post front-matter data `svg-headline`:

```
---
title: Hello World!
category: work
svg-headline: svg/post-title.svg
svg-headline-width: 400
svg-headline-height: 145
---
```

Note:

- The method to include SVG files has been changed since ([89d3dac341](http://github.com/sparanoid/sparanoid.com/commit/89d3dac3413e11e5139cf8c96e2adc490d27ad9a)), instead of embedding SVG into post files, now it include SVGs from external files using Liquid template tags `include`
- I use `for` loop here to include SVG file, it doesn't mean you can define multiple SVG headers here, it's just a workaround since include files in a sub-directory with variable [seems buggy](https://github.com/jekyll/jekyll/pull/1495)
- In most cases, you have to define `svg-headline-width` and `svg-headline-height` in order to make your SVG title responsive to your viewport.
 ([6c33d1d6](http://github.com/sparanoid/sparanoid.com/commit/6c33d1d678d9a5228f160bae82be8748c966501a))


<a name="24.0.5"></a>
### 24.0.5 (2014-04-01)


#### Bug Fixes

* **post:** remove unwanted HTML comments for posts ([f5ffc0ee](http://github.com/sparanoid/sparanoid.com/commit/f5ffc0ee55a32cbcbd8710d36d65006a44ec95e2))
* **style:** more aggressive “last-child” reset ([7b55093d](http://github.com/sparanoid/sparanoid.com/commit/7b55093d13e357a72d370b00db529424fba4fc27))


#### Features

* **style:**
  * remove unused `.btn` class ([600121ff](http://github.com/sparanoid/sparanoid.com/commit/600121ff0b16426c1898dbaf526b88c91c88e6fe))
  * simplified transition ([3e8baa82](http://github.com/sparanoid/sparanoid.com/commit/3e8baa82165dae2542ee30fd2b49bfbda8ba1a6f))
* **template:** add Redcarpet footnote support ([2c9d67f4](http://github.com/sparanoid/sparanoid.com/commit/2c9d67f439dbd17c2514475679d40ad515aaa895))


#### Breaking Changes

* New Redcarpet footnote will break existing footnote markup. Update your posts to avoid unwanted breaks.

You can read more about the footnote syntax at https://github.com/vmg/redcarpet
 ([2c9d67f4](http://github.com/sparanoid/sparanoid.com/commit/2c9d67f439dbd17c2514475679d40ad515aaa895))


<a name="24.0.4"></a>
### 24.0.4 (2014-04-01)


#### Bug Fixes

* **style:**
  * fix code block overflow scroll issue ([33be40d1](http://github.com/sparanoid/sparanoid.com/commit/33be40d1196fa42331bbba91cd32725a098695b8))
  * fix mismatched color variables ([865c13d6](http://github.com/sparanoid/sparanoid.com/commit/865c13d6c73f89a8ecabf50666c8391c42241aef))
  * clear float for `blockquote` footer ([1da7cf28](http://github.com/sparanoid/sparanoid.com/commit/1da7cf286d140a7e9076a3c6deec207f4f91dcc1))
* **template:** wrong home link hover effect for specified post color scheme ([9bbca0f7](http://github.com/sparanoid/sparanoid.com/commit/9bbca0f7b630bd8ee118f5433319a6256fb61b25))


#### Features

* better Redcarpet configurations, add some useful Redcarpet extensions ([2bd1c2a1](http://github.com/sparanoid/sparanoid.com/commit/2bd1c2a1c603dcbb686d55b6607989187f9326a1))
* use `rsrc.sparanoid.com` for assets URL ([445257d3](http://github.com/sparanoid/sparanoid.com/commit/445257d3a0898f40118e1563612f474fc2d83f35))
* **style:**
  * add a simple table style ([7b01cf56](http://github.com/sparanoid/sparanoid.com/commit/7b01cf56a56d369f00dd0cd03681a795233e6fb9))
  * add syntax highlight support ([006e14f1](http://github.com/sparanoid/sparanoid.com/commit/006e14f1d9ca04260c6d519ef737f203bf1cdd2e))
  * smaller margin space for image post title ([4eac0fda](http://github.com/sparanoid/sparanoid.com/commit/4eac0fdab6adcd68ddaf40451dd22dc034c83c07))
* **template:**
  * remove `.txt` wrapper ([1f400475](http://github.com/sparanoid/sparanoid.com/commit/1f400475e3f3611919299fdcccad73779539fd16))
  * update footer and read me for new jksf (a.k.a. Jekyll Scaffolding) branding ([13de5820](http://github.com/sparanoid/sparanoid.com/commit/13de58207961f52204545bf9ac91a03bb5f0bdf5))


#### Breaking Changes

* Removal of `.txt` CSS class may break your existing post layout. Now `.txt` is replaced with `main.content`, a global content wrapper. To fix layout breaks for your existing site: simply remove all `<div class=txt>` containers from your posts
 ([1f400475](http://github.com/sparanoid/sparanoid.com/commit/1f400475e3f3611919299fdcccad73779539fd16))


<a name="24.0.3"></a>
### 24.0.3 (2014-03-31)


#### Features

* add a fancy banner at the bottom of every page ([0760b036](http://github.com/sparanoid/sparanoid.com/commit/0760b036cb1d6daf2d900f9f203802cd0840ded8))
* **Gruntfile:**
  * add a fancy `time-grunt` plugin ([ab1c2822](http://github.com/sparanoid/sparanoid.com/commit/ab1c2822ca6022e6dcbacd3337f1b1fb5b49b32b))
  * new HTML smoosher task ([9d4dcb25](http://github.com/sparanoid/sparanoid.com/commit/9d4dcb25ee6c94da76945f151f0bc7385454a701))
* **package:** introduce grunt-conventional-changelog ([c732236b](http://github.com/sparanoid/sparanoid.com/commit/c732236b0d75c40c95a556ff67a504ebbf8435a4))
* **post:**
  * update “Kai Series” color scheme ([3457b2a8](http://github.com/sparanoid/sparanoid.com/commit/3457b2a80b85364d5d0dba3dd0b85242a2f085bc))
  * update post “ReadWise” ([5195c1e1](http://github.com/sparanoid/sparanoid.com/commit/5195c1e160a1a54e4e0cca933454d1d05235e6eb))
* **template:**
  * remove SVG icons ([860f6b4b](http://github.com/sparanoid/sparanoid.com/commit/860f6b4bf85671628b9329ecd6a074a5d37447b7))
  * try `minimal-ui` for iOS 7.1+ ([0215e148](http://github.com/sparanoid/sparanoid.com/commit/0215e148837ecf2ce701ee4da7af950fe76635eb))


#### Breaking Changes

* This will remove all SVG icon decorations for `.note`, `.store`, and `.download`
 ([860f6b4b](http://github.com/sparanoid/sparanoid.com/commit/860f6b4bf85671628b9329ecd6a074a5d37447b7))
* `smoosher` task will inline all `.css` and .js` files to reduce HTTP requests and increase load performance. It's ideal for small website with some basic styles just like this project.
 ([9d4dcb25](http://github.com/sparanoid/sparanoid.com/commit/9d4dcb25ee6c94da76945f151f0bc7385454a701))


### 24.0.0 (Jan 28, 2014)
- Bump deps version
- Readme badges update
- Remove Grunt badge
- Add a Bitdeli Badge to README
- Remove duplicated badge
- Update copyright date
- Use variables instead of hand-coded strings
- Gitkeep for img folder
- More variable fix
- Remove quotes
- Add codename
- Update robot.txt
- Remove unused post excerpt
- Add new post “Moonstruck Princess Extended”
- Correct margin right space
- Smaller block quote decoration for mobile devices
- Use src-dest format
- Simplified grunt task
- Update license year
- Fix typo, props @gordianz
- Draft folder, more info: http://jekyllrb.com/docs/drafts/
- Switch to Jekyll default markdown template
- Split main template into multiple partials
- `list-item.html` -> `page-item.html`
- Move custom variables into `_data`, more info: http://jekyllrb.com/docs/datafiles/
- `_source` -> `_app`
- Fix variable condition
- Better nav solution is here
- Site main style update
  - New header
  - New logo (favicon, etc.)
  - New color scheme
  - Typography minor tweak (Now sans-serif FTW)
- Add full width banner back

### 23.0.1 (Dec 14, 2013)
- Uses autoprefixer
- Update server task
- Update `usemin`
- Bump Flexslider version
- Store page minor update
- Fix line-height since refactor
- Update `archive` grunt
- Update changelog
- Add `cite` for blockquotes, more info see http://html5doctor.com/cite-and-blockquote-reloaded/
- Increase feed post limit
- Adds setup instructions
- Update post “Delicious.com”
- Bump cssmin version
- Adds icon set image for post “Delicious.com”
- Fix “Delicious.com” title wrapper on small devices
- Add hyphens support for headings
- Fix logo position
- Strip HTML in title section for Atom feed
- Update post “Tianjin Project Revision”
- Fix error page blur issue on retina display
- Bump dep version
- Update post “Tianjin Project Revision”
- Bump grunt version
- Update first post date
- Add a funny interrobang symbol
- Bump deps version
- Bump version, prepared for Assemble rework

### 23.0.0 (Oct 27, 2013) [#][23.0.0]
- Shorter hash filename
- Fixes *min and usemin tasks order
- Remove `-webkit-backface-visibility: hidden;`, doesn't compatible with `position: sticky;`
- Bump deps version
- Update post color scheme for “DOLLARS Chat Room”
- Better external link (link post) handle
- Adds quote marks for href links
- Middot style fix
- New (brighter) assets for IterCast
- Update font stack
- Remove appcache support, too buggy
- Remove custom font face
- Sub heading transition
- Update todo
- Update heading on mobile device
- Update upcoming post
- Retrieve old content from Time Machine
- Larger wrapper width

### 22.0.7 (Sep 17, 2013)

- Bump deps version
- Uses post thumb instead of img-headline
- Fixes typo
- Uppercased post title “Relative URL”
- Update deps order
- I LOVE UNIVERSAL SELECTORS
- Bump reps version
- Adds manifest grunt task
- More aggressive cache config
- Adds `<html>` head
- Fixes grunt-manifest versioning
- Rename apache manifest
- Rename CSS filename
- Feature: Appcache support
- Adds usemin task
- Remove unused dep
- Remove debug task config
- Reorder grunt tasks
- Feature: Assets revving
- Fixes compiling order
- Updates Jekyll exclude list
- Scalable file path

### 22.0.6 (Aug 9, 2013)

- Fix link in changelog
- Fix the link points to the real location in changelog
- `Mac OS X` --> `OS X`
- Disable Champaign Monitor custom domain URL
- CSS-style variables for LESS
- Bump deps versions
- Update license
- Simplified homepage copywirting
- Update homepage again
- Bump required deps
- Update remote hostname for Grunt deploy task
- Adds some comments to Grunt tasks
- More comment for Jekyll configuration file
- Build future posts for dev env
- Adds color scheme style
- Update and add color scheme for some posts
- Adds page.link for post with `page.img-headline`
- Better post syntax
- Simplified `.txt` paragraph style
- Update post syntax in notes
- Move post under work to its sub-categories
- Update railgun post background color
- Fixes typo
- Adds new post “IterCast”
- Adds space hack back
- Fixes inline CSS in html not compressed bug
- Fixes icons not filled with specific color scheme on some posts
- Update todo list
- Remove unused vars
- Give some love to my old posts
- Remove `::-webkit-validation-bubble` support: https://code.google.com/p/chromium/issues/detail?id=259050
- Update link color for post “IterCast”
- Disable HTML post compress for inline CSS, it kills normal paragraph spaces too

### 22.0.5 (Jul 1, 2013)

- Fix about page indents
- Remove theme previews from Postholic
- Adds post “7-Zip Chinese Simplified”
- License --> Licenses
- Adds new post “Notational Velocity”
- Updates todo
- Fix `grunt log` task

### 22.0.4 (Jun 26, 2013)

- Fix Gruntfile error
- Update packages
- Update homepage copywriting
- Fix tab indents
- Changelog: tab indents to space indents
- Update copywriting for homepage and about page

### 22.0.3 (Jun 26, 2013)

- license -> licenses
- Update .tm_properties
- Remove `feed.atom` -> `feed-atom.xml`
- Fix tab indents
- Changelog: tab indents to space indents
- Update copywriting for homepage and about page

### 22.0.2 (Jun 22, 2013)

- Update changelog
- Use dev deps badege
- Update dev deps badge
- Better post title line height
- Add new post “Start Page”
- Remove CSS *margin hack*, `time` elements shouldn’t be colapsed since it’s an inline element.
- More info: https://github.com/kangax/html-minifier/pull/67
- So you should wait html-minifier to fix that.
- No more codename
- No more `core.assets` variable
- Update readme
- Update grunt-concurrent, better log handling
- Update readme
- Optimize template structure, better central style, many more fixes
- Update changelog, bump version to 22.0.2

### 22.0.1 (Jun 13, 2013)

- More info for post “DOLLARS Chat Room”
- Fix version number in readme
- Update grunt-contrib-less to v0.6.0
- Yay my .less is already 1.4.0 compatible.
- Update enviroment requirement
- Updat Gruntfile
  - Fix cssmin task working directory
  - Better concurrent task ouput
  - Optimize concurrent order
- Update Jekyll settings
- Remove unused comments in Gruntfile
- Update `.™_properties` indent
- Re-init `package.json`
- Change gallery image order for post “Antiskill, Judgment Screensaver”
- Use my awsome version number
- New grunt task `log` - List current git commit log using `grunt log`
- Reserve back to original version number, bump version to 22.0.1

## 22.0.0 (Jun 13, 2013) [#][22.0.0]

- Move all element to align left
- Better Textmate exclude list
- Better work list
  - Remove image thumbnals, the same as Note page
  - No more `.width-unfixed` class for normal pages
- Shorten some post tiles
- Update posts structures for new design
  - Move Path Menu post from Note to Work
  - Add relative links for some posts in Work category
- Make it compatible with less 1.4 beta or greater
- Revert adding more margin space for `.tweet` button
- More details about post “ReadWise”
- “Latest Work” --> “Latest”
- Better copywriting
- No more `lazyload.html` for Work page
- Add my favorite titles back
- Better body padding for small screens
- Remove `.center` class, no longer need
- More multiple language titles
- Shorten Work page subtitle
- Fix typos
- Better template structure
- Simplify post title “find.ac Alter”
- No more `hgroup`, use `header + h1 + small`
- More structure fix, valid for w3c check
- Remove sponsor styles and HTML code
- Add a simple animation for latest work link
- Better post title image for new design
- Create new post “DOLLARS Chat Room”
- Simplify Atom feed structure, no more `post.thumb` determination
- Better navigation styles for small devices
- Add excludeInFileChooser for `.tm_properties`
- Update changelog
- Bump version 21-finale --> 22
- Update changelog
- Better Grunt server task with more Jekyll options support
- Fix buid task, create a new task `grunt archive` to create old design archive
- Update codename

## 21-finale (Jun 7, 2013) [#][21-finale]

- Hide img `alt`
- Update post 'Project Railgun'
- Add posts for newly released plugins.
- Update old post with 'img-headline'.
- Add `.reflist`, `.ref`, `.cite` for reference links in post
- Update post 'Tianjin Project'
- Update header for post 'Corner Bracket Lover'
- Add 'thumb' images for hidden posts from category 'Work'. The thumbnails I defined are mainly used by Twitter Cards meta
- Update posts for newly released plugins / theme
- Simplified Gemfile
- Better configuration for switching image assets URL
- Better file structure, fix empty space when a paragraph starts with some asian punctuation marks
- Add `:preview` task, experimental
- Better configuration file to control availability
- Update `::selection` style
- TL;DR
- Reset availability
- Remove `.work-list` in single post, update post navigation
- Simplify post navigation
- Retire accesskey
- Update browser style
- Remove useless posts
- Update post tag, remove some useless posts
- Add side projects section
- Make `twitter:description` a little bit longer than 200 letters, Twitter can handle it very well.
- Better template logic, minor tweaks
- Simplify template tags
- Upgrade Lazyload by @vvo to 1.0.0
- Use internal links instead of hardcoded links, read more about this specification at https://github.com/mojombo/jekyll/pull/369
- Update Jekyll to 0.12.0
- Add more description about default deploy task
- Initialize Lazyload as soon as it loads. props @vvo
- New post 'A List Apart 5.0'
- Add 'Donate' page
- Update text description for donate links
- Add exclude search list for Textmate
- Fix `site.url` for Twitter share button
- Update Jekyll to 0.12.1
- `info@sparanoid.com` -> `t@sparanoid.com`
- Remove post navigation
- newsletter.sparanoid.com instead of sparanoid.createsend.com
- Remove WebKit filter effect, not well supported on Retina Display
- Adds WebKit filter effect back
- Adds `.webkit-fix` hack to gain some performance and fix burry image using `-webkit-filter` on MacBook Pro with Retina display
- Remove `.webkit-fix` on body tag
- Remove unused post navigation CSS
- Adds.txt definition for 'Note' page
- Adds `.webkit-fix` for `:root`
- Updates `.index` background color for post 'Kai Series'
- Updates `Rakefile` with new path
- Adds new post ‘Kai Series’
- Compatible with Jekyll 1.*:
- Using directory-specified path for `post_url`
- Better configuration structure.
- Updates gitignore (`codekit-config.json` removed since it's no longer serving me)
- Remove support for `--file` flag
- Adds CONTRIBUTING.md and CHANGELOG.md
- Using the following command to update changelog: `git log 21..HEAD --reverse --format=%B | sed '/^$/d' | sed 's/^/- /'`
- Better changelog style
- Adds release date to changelog
- Updates changelog with generation instructions
- Fix changelog tab indent
- No more `tmp.txt` generated from changelog generator command
- Adds ATTRIBUTION.md based on teach.github.com
- Simplifies license in readme
- Updates `.gitignore`, remove logs from repo
- Better rake build script for handling image assets URL
- Update changelog with more accurate date and versions
- Better base URL handling
- Adds donate variable for Donate page
- Adds `a.css` back to repo
- Updates Jekyll version to 1.0.2
- Block old version archive
- Better post logo size with style `scoped` support
- Fix feed validation
- Remove `feed.rss`
- Add configuration comment
- Fix typos in `CHANGELOG.md`
- Fix typo in `_config.yml`
- Recompile CSS
- Update changelog with demo links
- Update changelog with old version screenshots
- Update changelog date
- Fix screenshots URLs in changelog
- Fix dead link in old post
- Fix  permission
- Adds package.json
- Add Grunt support, now use `grunt [task]` to manage server, build tasks
- Change source to 'https://rubygems.org' for secure HTTPS connection
- Add Travis support
- Add Travis and David badges
- Remove Gemfile.lock
- Remove unused grunt dependencies
- Remove old `rake serve` task, use jekyll itself
- Remode deprecated task :preview
- Read basic configurations from YAML
- Copy rake tasks to Gruntfile
- Move more rake tasks to Gruntfile
- Say goodbye to Rakefile
- Move scoped style into proper scope
- Add scoped style fallback
- Better less style with recess check
- More less properties order fix


## 21 (December 10, 2012)

- New header design
- Better comments
- Increase nav menu links spacing, since we've compressed and removed white spaces for HTML output. we need to add more space between links. More info: http://stackoverflow.com/questions/588356/
- Wrap all width-sensitive elements into `.wrapper`, prepared for the upcoming header
- Simplify deploy script
- Update project name
- Add special header for homepage
- Better arrow hover color
- Better header background gradient
- Better template indent
- Larger header post title
- Add font family variable
- Try ORCA CDN created by @livid
- Unfix header height
- Add FlexSlider for some interactive posts
- Update pagination position
- Add comments for better understanding. Updated Twitter Cards code
- Better header condition
- Better comments
- Add HTML5 form validation support
- Change subscription pages to category 'store'
- Bump copyright year
- Better CSS selector performance
- Update some posts thumbnails
- Add a `-webkit-filter` effect for `.work-list`
- Add some narrow typefaces fallback
- FlexSlider: `pauseOnHover: true`
- Fix `.paginaton` padding
- Add custom Jekyll support

## 20.1-finale (November 27, 2012) [#][20.1-finale]

- Simplified feed templates
- Uses `background-color` in transition statement to avoid animation effect on logo
- Add `role=announcement`
- Simplified `.gitignore` file
- Fixed typo, props @disinfeqt
- `lang="zh"` -> `lang=zh`
- More specified Rakefile comment
- Update post WordPress Plugin - Quotmarks Replacer, better blockquote styles
- Better tweet button position
- Merge posts
- Tabs -> spaces
- Remote post contents on page Note
- Shortened post URL and title 'Lester’s Plugins in Chinese'
- Single quotes -> double quotes
- Update post 'Lester’s Plugins in Chinese'
- Add new post '3.1 Billion in a Day'
- Add Twitter Card support
- Update logo
- Remove useless CSS define
- Add image lazy load support, more info at https://github.com/vvo/lazyload
- Use nginx empty gif module instead of data URI to small generated HTML size, read more info about nginx empty gif module: http://wiki.nginx.org/HttpEmptyGifModule
- `∞` (&#8734) -> `▲` (&#9650)

## 20.1 (October 7, 2012) [#][20.1]

- Convert Chinese posts to English
- Update post 'Tianjin Project'
- Update `.work-list` appearance
- Fix work-list on iPhone landscape
- Update post thumbnails
- Update post 'Font Zomnk'
- Update About page with microdata
- Fix typo
- Add `.store` style, embed SVG w/ data URI in LESS
- Added a workaround solution for yuicompressor bug, media query fix
- Remove lang variable. More post in English. Better hr styles with data attr.
- Fix `feed-all.rss` permalink
- Update ads code
- Update post 'Antiskill, Judgment Screensaver / Icon'
- `Rakefile` playing with YUICompressor
- Update post thumbnails style for works
- Update font, Add new post 'Tianjin Project × The World Economic Forum'
- Update post pubdate for 'Tianjin Project × The World Economic Forum'
- Update post 'Tianjin Project × The World Economic Forum'
- Update post thumbnail size in feed
- Better font size
- Update pagination position
- Add new post 'Safari 6 Loads Page Faster'
- Update clearfix method: http://nicolasgallagher.com/micro-clearfix-hack/
- Update comment for clearfix hack
- Simplified CSS and HTML code
- Inverted color for Error page
- Add tweet button, variables updated
- No more WOTY series
- Update decoration border, global body padding updated
- `apple-touch-icon` -> `apple-touch-icon-precomposed`
- HR description position update
- Update apple-touch-icon (precomposed)
- Update media query description
- Better media query, `.tweet` -> `.btn`
- Reset "New page: Work List"
- Add `site.url` variable.
- Added subscription page and form
- sparanoid.createsend.com -> newsletter.sparanoid.com
- Update newsletter server URL `newsletter.sparanoid.com` -> `sparanoid.createsend.com` again for SSL support.
- Update post Tianjin Project series
- Update post Lucky Star Skin for QQ / Sogou Pinyin IME
- This is an elements centered version, with the following verbose changes:
- All elements are centered.
- Simpler page navigation
- Shorter post title for some articles, make them look better on small screen
- Simplified iOS media query
- Adds media query to detect different screen resolution for `.work-list`
- Adds freelance status on homepage
- Uses `site.profile.email` variable on About page
- Adds `feed-note.atom` and `feed-work.atom` (Temporary)
- Update `.btn` styles

## 20 (July 16, 2012) [#][20]

- First commit prepared for v20
- Remove comments in LESS, `.work-list` minor tweak, remove text-align hook in error page
- Remove WOTY specified styles and structures
- Font updated, index updated, colophon updated, pagination position updated, infinite symbol position updated
- Update logo size
- Bump version to 20
- Remove leftover font
- Post minor changes
- Remove charset meta tag
- Update pagination position, again
- Fix typo, props @lianghai
- No more `.woty` class for this version
- Update `README.md`
- Add slide effect on navigation
- Fix `display: inline-block` parsing error in Firefox for navigation
- Fix pagination position, probably the last time I fix it.
- Rewind to Safari compatible navigation, ignore Firefox users
- An experiment rotate menu layout
- An experiment mouseover menu layout
- Remove unused mixins
- Add `text-align` workaround for post with Chinese, props @lianghai
- Fix typo, props @GordianZ
- Better menu transition effect
- Better HTML output, just looks better
- Fix pagination position, oh...
- HTML markup update
- Media query, iOS ready
- Logo and text pixel perfection, props @vaia
- Add `HTML compressor.rb` by @mytharcher
- Removed `HTML compressor.rg` by @mytharcher. Use the easier way: `htmlcompressor.jar` and `yuicompressor.jar` in `Rakefile` for minify HTML output code, this can provide pretty HTML code for development and serve minified version for production. sweet.
- Remove useless HTML comment
- Arrange posts in category folder, fixed wrong post URL
- Update post "lindsay-koinaka 3.0"
- Fix navigation in error page
- Add `.browser` style for website post display
- Better title position
- Category update: add Design and Drawing tag for posts in category Work. more style changes for work list and `.browser` frame
- Update post thumbnails
- New post 'Big Typography Dynasty'
- Add `Rakefile` to repo, finally
- Remove deprecated tasks
- Update thumbnails size for Work posts
- Update `.gitignore`
- Add screenshot for Tianjin Project
- Update thumbnails size for Work posts, again
- Add current page style for iOS, update pagination position
- "Update thumbnails size for Work posts, again", again
- Add `&#20;` for `htmlcompressor.jar`
- Fix `.work-list` for post
- Better title position
- Add section header for post 'Tianjin Project'
- Major changes for box models
- Clean up CSS
- Compress feeds
- Update h3 margin
- Remove whitespaces
- Add byline for Google Authorship, more information at http://support.google.com/webmasters/bin/answer.py?hl=en&answer=1408986
- Update complier path
- Update codename, bump to (real) version 20

## 19.3-finale (June 28, 2012) [#][19.3-finale]

- Better pagination for Note section with post title
- Remove bottom gradient
- Add `.download` and `.note` icons
- Better svg height for Safari and iOS Safari
- Another icon position fix when download and note blocks are used at the same time
- Update post 'SlimBox & VoxGrowl'
- Update post '7-Zip Iconset Redesigned (Version 2)'
- Better font stacks order
- Add new post series: Word of the Year (WOTY)
- Remove white spaces and other jam
- Unified excerpts for posts. Update Atom feed structure.
- Update permalink symbol for Note
- Update page 'About'
- Color variables ready, invert version reader
- Ready for invert
- Add new post 'I Don’t “Get” Art'
- Better Atom feed structure, passed feed validation by w3.org
- Update feed structure
- Remove Safari preview hack, since there's a cool type here.
- Fix Atom feed, again
- Fix HTML entries
- Fix quote marks
- Update my great Error 404 page
- RSS feed minor change
- Better font styles handling / Add blockquote
- Add some old posts
- Update dead link for old post
- Add old artwork posts / Update quote marks
- Update post thumbs
- Update hover background color in image list in "work"
- Update HTML structure, Simplified link border-bottom logic
- Add old post 'iGoogle Theme - Somilody 2'
- Update page 'Note' structure
- Decrease `.download` and `.note` font-size
- Update pseudo classes for `.work-list`
- Update media query for better UX for iPhone users. Add @space variable to take care of all spaces.
- Darker blockquote symbol
- Simplify media query syntax
- Replace `.a` with `role^=current`
- `role=current-page` -> `role=current`
- Add new post "“Free” Dribbble Invite"
- Update Word of the Year titles
- Refine CSS classes, remove unused styles, many minor fixes

## 19.3 (June 13, 2012) [#][19.3]

- More logo staff
- Still more logo staff
- Remove logo animation
- No more `<body>`
- Remove duplicates
- Update logo
- Update thumbnails style
- Better `line-height` control
- Change feeds URLs
- Remove experimental staff
- Update post 'Moonstruck Princess'
- Add new post 'Tianjin Project'
- Change `.txt` width
- Update logo
- Update assets filename / Better CSS naming for assets / Clean up CSS
- Larger title
- Update pagination position for new larger title
- Fix pagination position on the iPhone
- Fix hgroup width
- Better styles order
- Make `.txt` `max-width` variable
- Add placeholder background for images in work list

## 19.2 (April 18, 2012) [#][19.2]

- Remove ajaxify-html
- Add old posts
- Better title `line-height`
- Better typesetting for email address on mobile (small screen) device
- Anti SOPA
- Update CSS structure
- Update doctype
- Update link in post 'PaintStop Chinese Simplified for ZBrush 3.1 [Unofficial]'
- Make copyright year automatically update
- Update list decoration
- Clean `.gitignore`
- Configuration cleaned, typo fixed
- Remove `humans.txt`
- Simplified `_config.yml`
- Add assistive text to RSS 1.0
- Fix RSS 1.0 validating error
- `/feed/rss.xml` -> `/rss/index.xml`
- Modify Safari preview page
- Change words for post 'WordPress Plugin - Quotmarks Replacer'
- Update license
- Update logo

## 19.1 (January 13, 2012) [#][19.1]

- Logo updated
- Fix GitHub repo URL
- Add top transparent bar
- Add pagination
- Update ignore files
- Better top bar
- Update error page
- Update navigation padding
- Remove empty space
- Add translucent gradient at the bottom of the page
- Add navigator for category Work
- Better CSS logic
- Compressed `apple-touch-icon.png`
- Only use link when it's a external URL
- Removed useless vendor-free CSS styles
- Update post 'Path Menu Using CSS'
- Better feed output for posts with external links
- Add Store page, I'm going to sell cool things here
- Fix grammar for post 'Path Menu Using CSS'
- Add an arrow for external links in post page
- Update color scheme
- Remove leftovers
- Darker title
- Compressed CSS with YUI compressor
- Update CSS author comment
- Update favicon
- Remove useless space
- Better line-height for ad.
- Update code / pre color
- Add WebFont Loader by Google
- Manually rolled back to original font-face version
- Remove legacy font-face supports
- Better footer position
- Add Ajaxify with `histroy.js` and `ajaxify-html5.js`
- Remove fade effect, load script on demand
- Update ajaxify
- Remove fade effect again

## 19 (December 12, 2011) [#][19]

- Upgrade to ver. 19, codename lindsayisgod

## 18-finale (December 9, 2011) [#][18-finale]

- REMOVE `</script>` fix for Jekyll
- UPDATE font-family in image list
- UPDATE link border color
- UPDATE text block gradient
- UPDATE print and iPhone style
- UPDATE logo
- ADD `text-rendering`
- UPDATE about page
- UPDATE error page
- FIX HTML markup minor changes
- REMOVE Yoggrt ads scripts
- UPDATE image hover `background-color`
- ADD justified text-align and hyphens for post contents
- POST remove umbrella
- UPDATE post list styles
- POST add 'Path Menu Using CSS'
- FIX double slashes when a external link is defined in post.html
- Update logo
- Add BSA ads

## 18 (October 16, 2011) [#][18]

- ADD v18 mockup
- REMOVE pagination for category NOTE
- UPDATE thumbnail images styles
- ADD media query for iOS
- UPDATE navigation
- UPDATE `README.md`
- UPDATE Atom feed
- POST remove 'Nessa'
- REMOVE styles for atom feed
- ADD RSS feed for exporting to WordPress
- UPDATE `a:hover` style
- ADD transition for `a:hover` style
- UPDATE font-family
- UPDATE always show ads
- RENAME `rss.xml` -> `index.rss.xml`
- REMOVE category for RSS output, cause WordPress creates dummy categories.
- UPDATE pages
- UPDATE styles for v18

## 17-finale (October 1, 2011)

- REMOVE dead GitHub links
- POST minor changes
- FIX Jekyll parsing error
- REMOVE Rakefile
- UPDATE paginator

## 17 (2011) [#][17]

- BUMP version to 17 from old repo

## 16 (2011) [#][16]

- BUMP version to 16 from old repo

## 15 (2011) [#][15]

- BUMP version to 15 from old repo

## 14-finale (September 7, 2011)

- ADD fonts back due to the lack support of Firefox
- ADD new webkit gradient style
- UPDATE font files to CloudFront
- UPDATE prepared for upcoming version
- UPDATE URL for easy development

## 14.1 (February 11, 2011)

- UPDATE file structures
- FIX navigation in index
- UPDATE HTML structure and CSS cleanup
- UPDATE index display settings
- UPDATE Atom output
- UPDATE CloudFront files URL
- ADD error 404 page
- UPDATE assets files URL
- UPDATE host font files elsewhere
- UPDATE error page

## 14 (February 8, 2011) [#][14]

- UPDATE readme and license
- CREATE auto update script, inspired by https://github.com/henrik/henrik.nyh.se
- FIX datetime valid XML schema
- UPDATE deploy settings
- UPDATE site navigation
- UPDATE merge colors value to the same places
- FIX minor color fixed in nav
- UPDATE no more dark styles, CSS cleanup
- ADD current nav style
- FIX media query bug processed by YUI Compressor
- UPDATE footer DELETE redundant white spaces
- UPDATE deploy settings
- UPDATE page navigation
- UPDATE page navigation, transition cleanup
- UPDATE nav transition effect, HTML markup cleanup
- DELETE fade effect on page navigation
- UPDATE page navigation font size and paddings
- UPDATE decoration position
- UPDATE no more fluid position
- UPDATE deploy settings
- UPDATE codes cleanup and some minor changes

## 13 (2008 - March 2010)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/13/13-01.jpg)
- [Screenshot #02](http://sparanoid.com/lab/version/13/13-02.jpg)
- [Screenshot #03](http://sparanoid.com/lab/version/13/13-03.jpg)
- [Screenshot #04](http://sparanoid.com/lab/version/13/13-04.jpg)
- [Screenshot #05](http://sparanoid.com/lab/version/13/13-05.jpg)
- [Screenshot #06](http://sparanoid.com/lab/version/13/13-06.jpg)
- [Screenshot #07](http://sparanoid.com/lab/version/13/13-07.jpg)
- [Screenshot #08](http://sparanoid.com/lab/version/13/13-08.jpg)

## 12 (2007 - 2008)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/12/12-01.jpg)
- [Screenshot #02](http://sparanoid.com/lab/version/12/12-02.jpg)
- [Screenshot #03](http://sparanoid.com/lab/version/12/12-03.jpg)
- [Screenshot #04](http://sparanoid.com/lab/version/12/12-04.jpg)

## 11

Source code not available

## 10

Source code not available

## 09

Source code not available

## 08 (2007)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/08/08.png)

## 07 (2007)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/07/07.png)

## 06 (2007)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/06/06.jpg)

## 05 (2006)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/05/05-01.jpg)
- [Screenshot #02](http://sparanoid.com/lab/version/05/05-02.jpg)

## 04 (2006)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/04/04.jpg)

## 03 (2006)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/03/03.png)

## 02 (2005)

Source code not available

- [Screenshot #01](http://sparanoid.com/lab/version/02/02.jpg)

## 01 (2005)

Source code not available

- Initial release

[head]:         http://sparanoid.com/
[23.0.0]:       http://sparanoid.com/lab/version/23/
[22.0.0]:       http://sparanoid.com/lab/version/22/
[21-finale]:    http://sparanoid.com/lab/version/21-finale/
[20.1-finale]:  http://sparanoid.com/lab/version/20.1-finale/
[20.1]:         http://sparanoid.com/lab/version/20.1/
[20]:           http://sparanoid.com/lab/version/20/
[19.3-finale]:  http://sparanoid.com/lab/version/19.3-finale/
[19.3]:         http://sparanoid.com/lab/version/19.3/
[19.2]:         http://sparanoid.com/lab/version/19.2/
[19.1]:         http://sparanoid.com/lab/version/19.1/
[19]:           http://sparanoid.com/lab/version/19/
[18-finale]:    http://sparanoid.com/lab/version/18-finale/
[18]:           http://sparanoid.com/lab/version/18/
[17]:           http://sparanoid.com/lab/version/17/
[16]:           http://sparanoid.com/lab/version/16/
[15]:           http://sparanoid.com/lab/version/15/
[14]:           http://sparanoid.com/lab/version/14/