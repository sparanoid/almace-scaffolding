---
layout: post
title: Custom HTML Markups
category: note
plugin: lightense
tags: curtana
---

## `.note`, `.store`, and `.download`

A paragraph block with a thin border line.

### Usage

```html
<p class="download">
  <a href="https://github.com/sparanoid/sparanoid.com/">Download</a> it from GitHub
</p>

<p class="store">
  Love this plugin? please consider <a href="{{ "{{ site.profile.donate " }}}}">buying me a cup of coffee.</a>
</p>
```

Please note that you can’t apply CSS classes in Markdown, so you have to use HTML markup.

### Example

<p class="download">
  <a href="https://github.com/sparanoid/sparanoid.com/">Download</a> it from GitHub
</p>

<p class="store">
  Love this plugin? please consider <a href="{{ site.profile.donate }}">buying me a cup of coffee.</a>
</p>

## `.largetype`

Make normal paragraph text large enough.

### Usage

```html
<p class="largetype">
  <a href="{{ "{{ site.profile.donate " }}}}">PayPal</a>
</p>
```

Please note that you can’t apply CSS classes in Markdown, so you have to use HTML markup.

### Example

<p class="largetype">
  <a href="{{ site.profile.donate }}">PayPal</a>
</p>

## `.browser`

A simple browser frame using pure CSS.

### Usage

```html
<p class="browser">
  <img src="http://sparanoid.com/photo.jpg" alt="Image">
</p>
```

Please note that you can't apply CSS classes in Markdown, so you have to use HTML markup.

### Example

<p class="browser"><img src="http://rsrc.sparanoid.com/delicious.com.png" alt="Delicious Preview" class="no-lightense"></p>

## [Lightense Images](https://github.com/sparanoid/lightense-images)

A simple library inspired by [Tim Holman](https://github.com/tholman) to view large images up close using simple mouse interaction, and the full screen.

### Usage

Add the following setting to your post [front-matter field](http://jekyllrb.com/docs/frontmatter/):

```
plugin: lightense
```

Markdown markup:

```markdown
![Image](http://sparanoid.com/photo.jpg)
```

Or simply use HTML:

```html
<p>
  <img src="http://sparanoid.com/photo.jpg" alt="Image">
</p>
```

Lightense Images is activated globally by default, if you want to disable this effect for specific image, you can simply apply `.no-lightense` CSS class to your `<img>`:

```html
<p>
  <img src="http://sparanoid.com/photo.jpg" class="no-lightense" alt="Image">
</p>
```

Please note that if you're using HTML markup, you should wrap your images into a `<p>` container.

### Example

![Moonstruck Princess Extended - Red](http://rsrc.sparanoid.com/moonstruck-princess-ext-red.jpg)
