---
layout: post
title: Configuration
category: note
tags: getting-started
---

## Configuration SettingsPermalink

- All AMSF built-in settings can be configured at [`_config.yml`](https://github.com/sparanoid/almace-scaffolding/blob/master/_config.yml).
- Theme specific variables can be found at `./_app/_data/theme-name.yml`.
- Additional variables are stored in [`./_app/_data/`](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/_data) directory. They can be accessed by Jekyll. ([More info](http://jekyllrb.com/docs/datafiles/))
- You should also change `favicon.ico` and `apple-touch-icon.png` to yours.
- Some tasks in `Gruntfile.coffee` are not used in this project, they're copied from my own [website](https://github.com/sparanoid/sparanoid.com), I'll keep them untouched in case you need these.
- More customization please refer to theme specific documentation

## Tips

- Not familer with [Markdown](http://daringfireball.net/projects/markdown/)? Try [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
- You can use Jekyll's [built-in syntax highlighting](http://jekyllrb.com/docs/templates/#code-snippet-highlighting), I've included a default theme for this project.
- [Tables](https://help.github.com/articles/github-flavored-markdown#tables) and [footnotes](https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use) are also avaiables to use.
