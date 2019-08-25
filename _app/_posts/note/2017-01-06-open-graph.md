---
layout: post
title: Open Graph
category: note
plugin: lightense
tags: curtana
---

Theme Curtana has full Open Graph and Twitter Cards support.

It will look for the image in the following order:

1. Use `page.thumbnail` if defined in your post [front-matter field](https://jekyllrb.com/docs/frontmatter/).
2. If no specified `page.thumbnail` defined, it uses [Heading Background Image]({{ "/custom-heading-background.html" | relative_url }}) (aka. `page.heading-bg`) if defined in your post front-matter field.
3. If no heading background image found, Curtana will try to grab the first image (wrapped inside `<img>`) in your post as your post thumbnail
4. If nothing found, it falls back to `logo.png` located at your site root.

You can always use `page.thumb_force_logo` in your post's front-matter field to override the above lookup.

Here's a preview on Twitter:

![Twitter Cards (Open Graph compatible) Preview]({{ site.file }}/open-graph-preview.png)
