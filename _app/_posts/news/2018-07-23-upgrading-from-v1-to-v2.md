---
layout: post
title: Upgrading Guide from v1 to v2
category: news
---

Almace Scaffolding now migrates from Less to Sass, this may make your existing projects non-upgradable, it needs quite a lot of work for you to do the migration if you use a custom theme that it's powered by Less preprocessor. You have to compare your existing projects to [this Pull Request](https://github.com/sparanoid/almace-scaffolding/pull/85) side to side to make sure every change you made are synced correctly.

If you're a casual blogger only change some color variables for your default theme, Curtana in this situation, that's good, you can migrate to v2 easier: just run `$ grunt update`.

You should also migrate your own styles in `user.less` to `_user.scss` and `_varaibles.scss`. Due to Sass limitation, I don't have variable hoisting features like native CSS or Less at hand, so I have to create two user-defined stylesheets:

- `assets/_scss/_variables.scss` - This file should contain only Sass variables defined in theme Curtana. It will be loaded at the topmost of theme stylesheet `app.scss`.
- `assets/_scss/_user.scss` - where users create style customization.

From 2.0.0, Almace Scaffolding still has the ability to use Less with Grunt.js, however, it's wise to write your theme in Sass for better future compatibility.

If you'd like to stick with the Less version:

- v1.1.11 will be the last version that supports Less.
- Less version of theme Curtana will be available as `amsf/amsf-curtana-less`.
