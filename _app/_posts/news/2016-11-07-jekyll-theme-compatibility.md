---
layout: post
title: Jekyll Theme Compatibility
category: news
---

With the recent release of Jekyll, it gets the built-in ability to support [themes](https://jekyllrb.com/docs/themes/), since we've already added theme support in 2015, the original config variables `theme` would be conflicted with the built-in one.

To solve this issue, I've renamed our `theme` option to `amsf_theme`. And here's what you need to do to resolve compatibility issues after upgrading to latest Almace Scaffolding:

- Rename your original `theme` option in `_amsf.yml` to `amsf_theme`.
- Add `amsf_theme_url` with your theme Git URL.
- Replace all `site.theme` with `site.amsf_theme` in your page templates.
