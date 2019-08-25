---
layout: post
title: Custom Heading Background
category: note
tags: curtana
heading-bg: img/heading-background-example.jpg
heading-bg-local: true
heading-bg-color: "#070708"
heading-bg-size: "cover"
heading-bg-repeat: "no-repeat"
heading-bg-text: "#fff"
---

This is an example of custom heading background. You can simply add the following setting to your post [front-matter field](https://jekyllrb.com/docs/frontmatter/):

```yaml
heading-bg: img/heading-background.jpg
heading-bg-local: true
heading-bg-color: "#8141b1"
heading-bg-size: "100px 100px"
heading-bg-position: "center bottom"
heading-bg-repeat: "repeat"
heading-bg-text: "#fff"
```

`heading-bg`
: Background image filename, if a relative URL (non-external URL) is provided, the file will be prefixed with `site.file`.

`heading-bg-local`
: To avoid relative URL prefixed by `site.file`, you can set this option to `true` to prefix it with `amsf_user_assets`, then you can store your images in `_app/assets/`.

`heading-bg-color`
: Background color, recommend setting its value matches your image color tone.

`heading-bg-size`
: Background size, default value is `cover`.

`heading-bg-position`
: Background position, default value is `center center`.

`heading-bg-repeat`
: Background repeat, default value is `no-repeat`.

`heading-bg-text`
: Text color of the heading, set it based on your background image.

> Heading image copyright info:
> &copy; 士郎正宗・Production I.G／講談社・「攻殻機動隊」製作委員会
