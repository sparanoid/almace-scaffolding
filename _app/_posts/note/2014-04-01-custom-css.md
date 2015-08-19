---
layout: post
title: Unique Post Styling via Custom CSS
category: note
tags: customization
scheme-text: "#000"
scheme-link: "#a73300"
scheme-hover: "#ff4e00"
scheme-code: "#a73300"
css: |
  body {
    background-image: linear-gradient(to bottom, #fff500, #ff8f00);
  }
---

This is an example how to change your post styling via CSS. You can simply add the `css` option to your post [front-matter field](http://jekyllrb.com/docs/frontmatter/):

```
scheme-text: "rgba(100, 16, 0, .5)"
scheme-code: "#fff"
css: |
  body {
    background-image: linear-gradient(to bottom, #fff500, #ff8f00);
  }
```
