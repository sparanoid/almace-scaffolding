---
layout: post
title: Jekyll Theme Compatibility
category: news
---

With recent release of Jekyll, it gets the built-in ability to support [themes](https://jekyllrb.com/docs/themes/), since we've already added theme support in 2015, the original config variables `theme` would be conflicted with the built-in one.

To solve this issue, I've rename our `theme` option to `amsf_theme`. So now you can simply rename your original `theme` option in `_amsf.yml` to `amsf_theme` after processing the update.
