---
layout: post
title: Configuration
category: note
tags: getting-started
---

## Configuration Settings

- All AMSF built-in settings can be configured at [`_config.yml`](https://github.com/sparanoid/almace-scaffolding/blob/master/_config.yml).
- Theme specific variables can be found at `./_app/_data/theme-name.yml`.
- Additional variables are stored in [`./_app/_data/`](https://github.com/sparanoid/almace-scaffolding/blob/master/_app/_data) directory. They can be accessed by Jekyll. ([More info](https://jekyllrb.com/docs/datafiles/))
- You should also change `favicon.*` and `apple-touch-icon.png` to yours.
- `logo.png` is mainly used by Open Graph and Twitter Cards when there's no featured image in a post, you should also design your own.
- More customization please refer to theme-specific documentation

## Tips

- Not familiar with [Markdown](https://daringfireball.net/projects/markdown/)? Try [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
- You can use Jekyll's [built-in syntax highlighting](https://jekyllrb.com/docs/templates/#code-snippet-highlighting), I've included a default theme for this project.
- [Tables](https://kramdown.gettalong.org/quickref.html#tables) and [footnotes](https://kramdown.gettalong.org/quickref.html#footnotes) are also available to use.
