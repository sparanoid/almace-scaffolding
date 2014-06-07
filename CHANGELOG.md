<a name="0.0.11"></a>
### 0.0.11 (2014-06-05)


#### Features

* **post:** update posts for discontinued external links ([744f32f4](http://github.com/sparanoid/sparanoid.com/commit/744f32f46a5052c57bf7bfe272cd238e39fab621))
* **style:** remove obsoleted FlesSlider styles ([fd75b04c](http://github.com/sparanoid/sparanoid.com/commit/fd75b04c0fb6da967da33083aaf0a18045cba0b5))
* **template:** update Atom template ([73c236bf](http://github.com/sparanoid/sparanoid.com/commit/73c236bfabfcdb9f2628ff382ae6b3534c9bedc2))


#### Breaking Changes

* Now you can use `link_blog` and `rss_excerpt` for your Atom feed ([73c236bf](http://github.com/sparanoid/sparanoid.com/commit/73c236bfabfcdb9f2628ff382ae6b3534c9bedc2)):
  - `link_blog`: Enable this settings to make your feed Daring Fireball-like link blog. This basically change your <link> value to external link you defined in your posts.
  - `rss_excerpt`: Use post excerpt instead of full content for RSS feeds, just like WordPress RSS feed output option


<a name="0.0.10"></a>
### 0.0.10 (2014-05-16)


#### Features

* **style** add FlesSlider example ([33859332](http://github.com/sparanoid/almace-scaffolding/commit/338593320f0f0c07ba150c5b5834a6916cd8f608))
* **docs:** addd video tutorials link ([96379d27](http://github.com/sparanoid/almace-scaffolding/commit/96379d27455bd7e5304b08641d8309a5af6858a4))


<a name="0.0.9"></a>
### 0.0.9 (2014-05-16)


#### Bug Fixes

* **post:** fix post grammar ([d1cdebdd](http://github.com/sparanoid/sparanoid.com/commit/d1cdebdd92a1d38ef81195a21a03346a03b46c1f))
* **style:**
  * fix wrong scoped style use ([79e71de0](http://github.com/sparanoid/sparanoid.com/commit/79e71de08a1be4f7a404c94d8d77889af111497f))
  * avoid line-height override for `amsf` ([d24663fd](http://github.com/sparanoid/sparanoid.com/commit/d24663fddbc4fdac012edd32aab86ad549632d5b))


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


<a name="0.0.8"></a>
### 0.0.8 (2014-04-27)


#### Bug Fixes

* include the missing gem lock file ([2a546df9](http://github.com/sparanoid/sparanoid.com/commit/2a546df94bdeea1ead054ef653627fb9b92a4e2e))
* **style:**
  * avoid smoosh container edge ([75f66dfc](http://github.com/sparanoid/sparanoid.com/commit/75f66dfcfc60ef3e17f26c652a5e9e32006b835f))
  * remove padding reset for last child elements ([62caf45f](http://github.com/sparanoid/sparanoid.com/commit/62caf45fc00132192694a9994a36ba168bf2cf1c))


#### Features

* better external link post indicator ([6393ea07](http://github.com/sparanoid/sparanoid.com/commit/6393ea07d74672599b9cf7dd17ec5a3becb65174))
* change error page permalink for GitHub Pages ([b03097ce](http://github.com/sparanoid/almace-scaffolding/commit/b03097cef9baf7c9ea238e2eeca848cefb0c8718))
* **style:** SVG headlines got viewport units support ([f818a7b1](http://github.com/sparanoid/sparanoid.com/commit/f818a7b1d626a4581c4a1d81df06d17d7c9b4dd1))
* **grunt:** better grunt tasks excluding files those need post-process ([b1dd8c01](http://github.com/sparanoid/almace-scaffolding/commit/b1dd8c017912abe908602439881f8627be112803))
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


<a name="0.0.7"></a>
### 0.0.7 (2014-04-01)


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


<a name="0.0.6"></a>
### 0.0.6 (2014-04-01)


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
  * split `amsf` specified styles into `custom.less` ([27061574](http://github.com/sparanoid/almace-scaffolding/commit/27061574d7d2b0ac42b3f0887f4ccfcfacafb8f9))
* **template:**
  * remove `.txt` wrapper ([1f400475](http://github.com/sparanoid/sparanoid.com/commit/1f400475e3f3611919299fdcccad73779539fd16))
  * update footer and read me for new amsf (a.k.a. Almace Scaffolding) branding ([13de5820](http://github.com/sparanoid/sparanoid.com/commit/13de58207961f52204545bf9ac91a03bb5f0bdf5))


#### Breaking Changes

* Removal of `.txt` CSS class may break your existing post layout. Now `.txt` is replaced with `main.content`, a global content wrapper. To fix layout breaks for your existing site: simply remove all `<div class=txt>` containers from your posts
 ([1f400475](http://github.com/sparanoid/sparanoid.com/commit/1f400475e3f3611919299fdcccad73779539fd16))


<a name="0.0.5"></a>
### 0.0.5 (2014-03-31)


#### Features

* add a fancy banner at the bottom of every page ([0760b036](http://github.com/sparanoid/sparanoid.com/commit/0760b036cb1d6daf2d900f9f203802cd0840ded8))
* **Gruntfile:**
  * add a fancy `time-grunt` plugin ([ab1c2822](http://github.com/sparanoid/sparanoid.com/commit/ab1c2822ca6022e6dcbacd3337f1b1fb5b49b32b))
  * new HTML smoosher task ([9d4dcb25](http://github.com/sparanoid/sparanoid.com/commit/9d4dcb25ee6c94da76945f151f0bc7385454a701))
* **package:** introduce grunt-conventional-changelog ([c732236b](http://github.com/sparanoid/sparanoid.com/commit/c732236b0d75c40c95a556ff67a504ebbf8435a4))
* **template:**
  * remove SVG icons ([860f6b4b](http://github.com/sparanoid/sparanoid.com/commit/860f6b4bf85671628b9329ecd6a074a5d37447b7))
  * try `minimal-ui` for iOS 7.1+ ([0215e148](http://github.com/sparanoid/sparanoid.com/commit/0215e148837ecf2ce701ee4da7af950fe76635eb))
  * sync from sparanoid.com ([19680a25](http://github.com/sparanoid/almace-scaffolding/commit/19680a252a6fcda363b58d9f42dd3efd25497cba))


#### Breaking Changes

* This will remove all SVG icon decorations for `.note`, `.store`, and `.download`
 ([860f6b4b](http://github.com/sparanoid/sparanoid.com/commit/860f6b4bf85671628b9329ecd6a074a5d37447b7))
* `smoosher` task will inline all `.css` and .js` files to reduce HTTP requests and increase load performance. It's ideal for small website with some basic styles just like this project.
 ([9d4dcb25](http://github.com/sparanoid/sparanoid.com/commit/9d4dcb25ee6c94da76945f151f0bc7385454a701))



<a name="0.0.4"></a>
### 0.0.4 (2014-02-25)

#### Features

* **package:** add grunt-conventional-changelog support ([8346b783](http://github.com/sparanoid/almace-scaffolding/commit/8346b783c2c8f3634d0d3e21e97aa340c5457bd1))
* **styles:** new `.largetype` class, replaces old button styles ([532bf5f2](http://github.com/sparanoid/almace-scaffolding/commit/532bf5f21a32601dbb26fa75864effbfeb16f659))

### 0.0.3 (2014-02-16)

- Better test task
- Add `custom.less`
- Sync templates from sparanoid.com
  - Logo update
  - Now use viewport units
- Add HTML validation task
- Use `grunt-contrib-less` instead of `grunt-recess`

### 0.0.2 (2014-01-28)
- Bump Jekyll required version
- Update file structure
- Sync Gruntfile from sparanoid.com
- Sync styles from sparanoid.com

### 0.0.1 (2014-01-06)
- First usable version
