---
layout: post
title: "Upgrading Guide: v1.1.0"
category: news
---

There're some significant changes in update v1.1.0, action required after you upgrade Almace Scaffolding.

In your front-matter fields:

- Replace all `svg-headline`, `img-headline` with `heading-img`.
- Replace all `svg-headline-width`, `img-headline-width` with `heading-img-width`.
- Remove all `svg-headline-height`, `img-headline-height` as they're deprecated and no longer available.
- Add `heading-img-local: true` if images are stored right inside your project.

Check the following front-matter data for post thumbnails:

- Replace all `thumb` with `thumbnail`.
- Add `thumb/` prefix to your filename, ie. `thumbnail: thumb/my-post.png`.
- Add `thumbnail-local: true` if thumbnails are stored right inside your project.
