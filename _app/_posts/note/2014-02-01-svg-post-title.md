---
layout: post
title: SVG Post Title
category: note
hidden: true
---

> The content of this post in deprecated, please see [Custom Heading Image]({{ "/custom-heading-image.html" | relative_url}}) for more info.

This is an example of a custom post title using an SVG image. You can simply add the following setting to your post [front-matter field](https://jekyllrb.com/docs/frontmatter/):

```yaml
svg-headline: svg/cool-title.svg
svg-headline-width: 400
svg-headline-height: 86
```

The image defined for `svg-headline` should be stored at `_app/assets/svg/cool-title.svg`, you can simply keep these title images under Git control, they will be inlined into the HTML pages using Grunt.js in production builds. The `svg-headline-width` and `svg-headline-height` are optional if you have correct dimensions for your images.

There's also an option for common raster images, but please note that these files should be stored at where you define `site.file`.

```
img-headline: cool-title.png
img-headline-width: 500
```

> **Pro Tips**: Keep a `<title>` tag for your SVG can help Safari generate correct post title for its Reader mode:

```html
<svg xmlns="http://www.w3.org/2000/svg">
<title>Cool Article</title>
…
```
