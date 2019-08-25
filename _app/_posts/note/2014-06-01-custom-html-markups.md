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

```md
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

```md
[PayPal](donate)
{: .largetype}
```

### Example

[PayPal](https://sparanoid.com/donate/)
{: .largetype}

## `.browser`

A simple browser frame using pure CSS.

### Usage

```md
![Image](https://sparanoid.com/logo.png)
{: .browser}
```

### Example

![Delicious Preview]({{ site.file }}/delicious.com.png){: .no-lightense}
{: .browser}

## [Lightense Images](https://sparanoid.com/work/lightense-images/)

A simple library inspired by [Tim Holman](https://github.com/tholman) to view large images up close using simple mouse interaction, and the full screen.

### Usage

Add the following setting to your post [front-matter field](https://jekyllrb.com/docs/frontmatter/):

```
plugin: lightense
```

Markdown markup:

```md
![Image](https://sparanoid.com/photo.jpg)
```

Lightense Images is activated globally by default, if you want to disable this effect for specific image, you can simply apply `.no-lightense` CSS class to your image or `<img>`:

```md
![Image](https://sparanoid.com/logo.png){: .no-lightense}
```

Please note that if you're using HTML markup, you should wrap your images into a `<p>` container.

### Example

![Moonstruck Princess Extended - Red]({{ site.file }}/moonstruck-princess-ext-red.jpg)

## Image Sizes

There're different size helpers for images. They're available using the following CSS classes:

### Small Size

```md
![Image](https://sparanoid.com/logo.png){: .size-small}
```

![Moonstruck Princess Extended - orange]({{ site.file }}/moonstruck-princess-ext-orange.jpg){: .size-small}

### Medium Size

The medium size is the default size of images, so you don't need additional CSS classes for it.

```md
![Image](https://sparanoid.com/logo.png)
```

![Moonstruck Princess Extended - Yellow]({{ site.file }}/moonstruck-princess-ext-yellow.jpg)

### Large Size

```md
![Image](https://sparanoid.com/logo.png){: .size-large}
```

![Moonstruck Princess Extended - Green]({{ site.file }}/moonstruck-princess-ext-green.jpg){: .size-large}

### Aligned Images

```md
![Image](https://sparanoid.com/logo.png){: .size-left}

![Image](https://sparanoid.com/logo.png){: .size-right}
```

![Moonstruck Princess Extended - Blue]({{ site.file }}/moonstruck-princess-ext-blue.jpg){: .size-left}

Aligned images are smaller images beside the text, you can just apply `.size-left` or `.size-right` to your images and nothing special markup required. However, that aligned images will be responded to normal large size for small desktops or mobile devices.

### Small Images

Useful for images smaller than container width.

```md
![Image](https://sparanoid.com/logo.png){: .no-resize}
```

![Run?]({{ site.file }}/who-can-run.png){: .no-resize}

### Small Images (center)

```md
![Image](https://sparanoid.com/logo.png){: .no-resize.center}
```

![Run?]({{ site.file }}/who-can-run.png){: .no-resize.center}
