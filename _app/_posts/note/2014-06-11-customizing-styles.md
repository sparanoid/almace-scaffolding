---
layout: post
title: Customizing Styles
category: note
tags: customization
---

You can customize the basic look and feel without touching the theme files by changing `user.js` and `user.less`:

```
├── _app/
|   ├── assets/
|   |   └── _js/
|   |   |   └── user.js
|   |   └── _less/
|   |   |   └── user.less
|   |   └── themes/
|   |   |   └── ...
```

These files won't be overwritten when you update Almace Scaffolding or update your themes.
