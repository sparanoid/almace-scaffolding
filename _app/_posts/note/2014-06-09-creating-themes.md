---
layout: post
title: Creating Your Own Theme
category: note
tags: customization
---

## Overview

You can create your own theme in AMSF, theme files are located in the following location (I use default theme Curtana here for better understanding):

```
├── _app/
|   ├── _data/
|   |   └── curtana.yml
|   ├── _includes/
|   |   └── themes/
|   |   |   └── curtana/
|   |   |   |   └── includes/
|   |   |   |   └── layouts/
|   ├── _pages/
|   |   └── themes/
|   |   |   └── curtana/
|   |   |   |   └── example-page.md
|   |   |   |   └── ...
|   ├── assets/
|   |   └── themes/
|   |   |   └── curtana/
|   |   |   |   └── _js/
|   |   |   |   └── _scss/
|   |   |   |   └── ...
```

The theme specific config `curtana.yml` should have the same filename as your theme name. It should contain theme-specific variables and can also override AMSF built-in settings.

More info about theme structure you can check out my default theme [Curtana](https://github.com/amsf/amsf-curtana).

You can also have multiple themes in your project, as many as you like. For example if you also have themes Bootstrap and Ghost installed, the file structure should be:

```
├── _app/
|   ├── _data/
|   |   └── bootstrap.yml
|   |   └── curtana.yml
|   |   └── ghost.yml
|   ├── _includes/
|   |   └── themes/
|   |   |   └── bootstrap/
|   |   |   |   └── includes/
|   |   |   |   └── layouts/
|   |   |   └── curtana/
|   |   |   |   └── includes/
|   |   |   |   └── layouts/
|   |   |   └── ghost/
|   |   |   |   └── includes/
|   |   |   |   └── layouts/
|   ├── _pages/
|   |   └── themes/
|   |   |   └── bootstrap/
|   |   |   |   └── example-about.md
|   |   |   |   └── example-blog.md
|   |   |   |   └── example-fluid-container.md
|   |   |   |   └── ...
|   |   |   └── curtana/
|   |   |   |   └── example-about.md
|   |   |   |   └── example-news.md
|   |   |   |   └── ...
|   |   |   └── ghost/
|   |   |   |   └── example-archive.md
|   |   |   |   └── example-page.md
|   |   |   |   └── example-tagcloud.md
|   |   |   |   └── ...
|   ├── assets/
|   |   └── themes/
|   |   |   └── bootstrap/
|   |   |   |   └── _coffee/
|   |   |   |   └── _scss/
|   |   |   |   └── images/
|   |   |   └── curtana/
|   |   |   |   └── _js/
|   |   |   |   └── _scss/
|   |   |   |   └── svg/
|   |   |   └── ghost/
|   |   |   |   └── _js/
|   |   |   |   └── _less/
|   |   |   |   └── fonts/
...
```

## AMSF Options

There're several built-in options you can use in your theme. These options can also be overridden in theme-specific config.

### `site.name`

Template:

```html
<footer class="footer">
  <ul>
    <li><a href="/">{{ "{{ site.name " }}}}</a></li>
    <li><a href="/atom.xml">Atom</a></li>
  </ul>
</footer>
```

Output:

```html
<footer class="footer">
  <ul>
    <li><a href="/">Almace Scaffolding</a></li>
    <li><a href="/atom.xml">Atom</a></li>
  </ul>
</footer>
```

### `site.description`

Site description will appear in the document meta and Atom feed subtitle.

Template:

```html
<meta property="og:description" content="{{ '{{ site.description ' }}}}">
```

Output:

```html
<meta property="og:description" content="A super-fast Jekyll framework fighting against the website obesity.">
```

### `site.file`

Media assets URL used in posts, without trailing slash. In most cases this URL should be powered by a CDN provider.

Config:

```yaml
file: //d349cztnlupsuf.cloudfront.net
```

Template:

```html
<img src="{{ '{{ site.file ' }}}}/post-thumbnail.jpg">
```

Output:

```html
<img src="//d349cztnlupsuf.cloudfront.net/post-thumbnail.jpg">
```

### `site.twitter`

Site Twitter account handle.

Template:

```html
<a href="https://twitter.com/{{ '{{ site.twitter ' }}}}">Follow @{{ '{{ site.twitter ' }}}} on Twitter</a>
```

Output:

```html
<a href="https://twitter.com/sparanoid">Follow @sparanoid on Twitter</a>
```

### `site.force_utf_8`

Force UTF-8 encoding, enable this will simply add `<meta charset="utf-8">` to the head of your pages.

Template:

```html
{{ '{% if site.force_utf_8 ' }}%}
  <meta charset="utf-8">
{{ '{% endif ' }}%}
```

### `site.robots`

You can define your own records in `robots.txt`.

Config:

```yaml
robots:
  - "User-agent: *"
  - "Disallow: /ajax/"
  - "Disallow: /@async"
  - "Disallow: /log/"
```

## Theme Features

There're some features can be integrated into your theme.

### (Basic) Multi-Language Support

You can define post/page language in your front-matter field:

```yaml
lang:
  - zh-tw
```

An additional `lang` HTML attribute will be added to your final rendering:

```html
<article lang="zh-tw">
  ...
</article>
```

If your post/page content is multilingual, you can also define multiple languages in array:

```yaml
lang:
  - zh-tw
  - en-us
```

Please note that only the first item defined in `lang` array will be used in final `lang` output, the additional languages will be available in JSON feed output:

```json
{
  "languages": ["zh-tw", "en-us"],
  "categories": ["note"],
  "tags": ["miscellaneous"]
}
```

### Smooshing Assets

For better performance, Almace Scaffolding will find all the CSS, script links and images in compiled HTML, and outputs a version with all the CSS, scripts and images (Base64) written inline. Sounds cool? but it needs theme support. Here's how:

You can simply add the query string `?assets-inline` at the end of the file you'd like to be inlined in production site:

```html
<!-- This CSS will be inlined into HTML -->
<link rel="stylesheet" href="{% raw %}{{ '/css/app.css?assets-inline' | prepend: amsf_theme_assets }}{% endraw %}">

<!-- This script will be inlined into HTML -->
<script src="{% raw %}{{ '/js/app.js?assets-inline' | prepend: amsf_theme_assets }}{% endraw %}"></script>
```

### User Custom Styles Support

Define the following code snippet into your theme styles (Sass) will allow users to custom your theme without touching the theme files:

```css
// Import user custom styles
@import "../../../_scss/custom";
```

### User Custom Scripts Support

Define the following code snippet into your theme template (it's recommended to put it in footer) will allow users to add custom scripts without touching the theme files:

```html
<!-- User custom scripts -->
<script src="{% raw %}{{ '/js/user.js?assets-inline' | prepend: amsf_user_assets }}{% endraw %}"></script>
```

### Page / Post Specific CSS Block Support

This allows your user to define page / post specific CSS blocks in front-matter data:

```html
<!-- Page-wide custom CSS -->
{% raw %}{{ amsf_page_css }}{% endraw %}
```

### Google Analytics Support

This allows your user to be able to use Google Analytics for their site, tracking ID can be changed in the config file:

```html
<!-- Google Analytics tracking code -->
{% raw %}{{ amsf_google_analytics }}{% endraw %}
```

### Post Published Time

This allows you to get the published time of the current post.

Template:

```html
<meta property="article:published_time" content="{% raw %}{{ amsf_page_pubdate | date_to_xmlschema }}{% endraw %}">
```

Output:

```html
<meta property="article:published_time" content="2014-01-01T00:00:00+08:00">
```

### Post Modified Time

This allows you to get the modified time of the current post.

Template:

```html
<meta property="article:modified_time" content="{% raw %}{{ amsf_page_update | date_to_xmlschema }}{% endraw %}">
```

Output:

```html
<meta property="article:modified_time" content="2014-01-03T03:17:49+08:00">
```

### Post Reading Time

This allows you to show the average reading time of current post.

Template:

```html
Reading time: {% raw %}{{ amsf_page_reading_time }}{% endraw %}
```

Output:

```md
# Less than 200 words
Reading time: Less than 1 min

# Around 200 words
Reading time: 1 min

# More than 200 words
Reading time: 34 mins

# More than 1 hour
Reading time: 1 hr
Reading time: 1 hr 1 min
Reading time: 3 hrs 20 mins
```

## Publishing Themes

You really like your custom design and wanna show it off to the world? Cool, you can create (pack) you own theme by the following command:

```sh
$ grunt theme-save
```

The activated theme will be saved to AMSF cache (`.amsf-cache/`) with correct file and directory structure, then you can upload your theme to GitHub.

Still confusing? see my default theme [Curtana](https://github.com/amsf/amsf-curtana) for reference.
