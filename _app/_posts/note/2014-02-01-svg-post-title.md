---
layout: post
title: SVG Post Ttile
category: note
hidden: true
svg-headline: svg/kai.svg
svg-headline-width: 400
svg-headline-height: 86
scheme-text: "#b93b00"
scheme-link: "#9b3100"
scheme-hover: "#ffe000"
scheme-code: "#ffe000"
scheme-bg: "#ff9610"
---

This is an example of custom post title using SVG image. You can simply add the folloing setting to your post [front-matter field](http://jekyllrb.com/docs/frontmatter/):

```
svg-headline: svg/kai.svg
svg-headline-width: 400
svg-headline-height: 86
```

Image defined for `svg-headline` should be stored at `_app/_includes/svg/`, you can simply keep these title images under Git control, they will be smooshed into the HTML pages using Grunt.js in production environment. The `svg-headline-width` and `svg-headline-height` can be omitted if you have correct dimensions for your images.

There's also an option for common raster images, but please note that these files should be stored at where you define `site.file`.

```
img-headline: imouto-logo-large.png
img-headline-width: 500
```

**Pro Tips**: Keep a `<title>` tag for your SVG can help Safari generate correct post title for its Reader mode:

```
<svg xmlns="http://www.w3.org/2000/svg" width="2175" height="465" viewBox="0 0 2175 465">
<title>Kai Series</title>
…
```
