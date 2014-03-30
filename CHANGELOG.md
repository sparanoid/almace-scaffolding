<a name="0.0.5"></a>
### 0.0.5 (2014-03-31)


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
  * sync from sparanoid.com ([19680a25](http://github.com/sparanoid/jekyll-scaffolding/commit/19680a252a6fcda363b58d9f42dd3efd25497cba))


#### Breaking Changes

* This will remove all SVG icon decorations for `.note`, `.store`, and `.download`
 ([860f6b4b](http://github.com/sparanoid/sparanoid.com/commit/860f6b4bf85671628b9329ecd6a074a5d37447b7))
* `smoosher` task will inline all `.css` and .js` files to reduce HTTP requests and increase load performance. It's ideal for small website with some basic styles just like this project.
 ([9d4dcb25](http://github.com/sparanoid/sparanoid.com/commit/9d4dcb25ee6c94da76945f151f0bc7385454a701))



<a name="0.0.4"></a>
### 0.0.4 (2014-02-25)

#### Features

* **package:** add grunt-conventional-changelog support ([8346b783](http://github.com/sparanoid/jekyll-scaffolding/commit/8346b783c2c8f3634d0d3e21e97aa340c5457bd1))
* **styles:** new `.largetype` class, replaces old button styles ([532bf5f2](http://github.com/sparanoid/jekyll-scaffolding/commit/532bf5f21a32601dbb26fa75864effbfeb16f659))

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
