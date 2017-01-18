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

```markdown
[Download](download) it from GitHub
{: .download}

Love this plugin? please consider [buying me a cup of coffee](donate).
{: .store}
```

### Example

[Download](https://github.com/sparanoid/sparanoid.com/) it from GitHub
{: .download}

Love this plugin? please consider buying me a cup of coffee.
{: .store}

## `.largetype`

Make normal paragraph text large enough.

### Usage

```markdown
[PayPal](donate)
{: .largetype}
```

### Example

[PayPal](donate)
{: .largetype}

## `.browser`

A simple browser frame using pure CSS.

### Usage

```markdown
![Image](https://sparanoid.com/logo.png)
{: .browser}
```

### Example

![Delicious Preview]({{ site.file }}/delicious.com.png){: .no-lightense}
{: .browser}

## [Lightense Images](https://sparanoid.com/work/lightense-images/)

A simple library inspired by [Tim Holman](https://github.com/tholman) to view large images up close using simple mouse interaction, and the full screen.

### Usage

Add the following setting to your post [front-matter field](http://jekyllrb.com/docs/frontmatter/):

```
plugin: lightense
```

Markdown markup:

```markdown
![Image](https://sparanoid.com/photo.jpg)
```

Lightense Images is activated globally by default, if you want to disable this effect for specific image, you can simply apply `.no-lightense` CSS class to your image or `<img>`:

```markdown
![Image](https://sparanoid.com/logo.png){: .no-lightense}
```

Please note that if you're using HTML markup, you should wrap your images into a `<p>` container.

### Example

![Moonstruck Princess Extended - Red]({{ site.file }}/moonstruck-princess-ext-red.jpg)
