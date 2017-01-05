---
layout: post
title: Custom Heading Background
category: note
tags: curtana
heading-bg: img/title-background-example.jpg
heading-bg-local: true
heading-bg-color: "#8141b1"
heading-bg-size: "cover"
heading-bg-position: "center bottom"
heading-bg-repeat: "no-repeat"
heading-bg-text: "#fff"
---

This is an example of custom heading background. You can simply add the following setting to your post [front-matter field](http://jekyllrb.com/docs/frontmatter/):

```yaml
heading-bg: img/heading-background-tile.jpg
heading-bg-local: true
heading-bg-color: "#8141b1"
heading-bg-size: "100px 100px"
heading-bg-position: "center bottom"
heading-bg-repeat: "repeat"
heading-bg-text: "#fff"
```

`heading-bg`
: Background image filename, it a relative URL (non-external URI) is provided, the file will be prefixed with `site.file`.

`heading-bg-local`
: To avoid relative URL prefixed by `site.file`, you can set this option to `true` to prefix it with `amsf_user_assets`.

`heading-bg-color`
: Background color, recommend setting its value matches your image color tone.

`heading-bg-size`
: Background size, default value is `cover`.

`heading-bg-position`
: Background position, default value is `center center`.

`heading-bg-repeat`
: Background repeat, default value is `no-repeat`.

`heading-bg-text`
: Text color in heading, set it based on your background image.
