---
layout: post
title: Custom Heading Image
category: note
tags: curtana
heading-img: svg/heading-image-example.svg
heading-img-local: true
---

This is an example of custom post heading image. You can simply add the following setting to your post [front-matter field](https://jekyllrb.com/docs/frontmatter/):

```yaml
heading-img: svg/heading-image.svg
heading-img-local: true
heading-img-width: 400
```

> In Almace Scaffolding v1.1.0, the original `svg-headline*`, and `img-headline*` options are deprecated.

`heading-img`
: Heading image filename, if a relative URL (non-external URL) is provided, the file will be prefixed with `site.file`.

`heading-img-local`
: To avoid relative URL prefixed by `site.file`, you can set this option to `true` to prefix it with `amsf_user_assets`, then you can store your images in `_app/assets/`.

`heading-img-width`
: Set the width of your heading image. The value will be converted to viewport unit automatically. ie. `heading-img-width: 400` will be converted to `width: 40vw`;


> **Pro Tips**: Keep a `<title>` tag for your SVG can help Safari generate correct post title for its Reader mode:

```html
<svg xmlns="http://www.w3.org/2000/svg">
<title>Cool Article</title>
…
```
