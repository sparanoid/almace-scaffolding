---
layout: post
title: Markup Example
category: note
plugin: intense
hidden: true
---

Lorem lean startup ipsum **product market fit customer development** acquihire technical cofounder. User engagement A/B testing shrink a market venture capital pitch deck. Social bookmarking group buying [crowded market](#) pivot onboarding freemium prototype ping pong. Early stage disruptive ecosystem community outreach dynamic location based strategic investor.

<blockquote>
  <p>Two days ago the Chinese website <a href="http://www.taobao.com/">Taobao</a> held a discount promotion to celebrate what’s known as “double sticks day” in China. In a single 24hr period, they conducted 19bn RMB (US$3.06bn) of business.</p>
  <footer>
    <cite><a href="http://westiseast.co.uk/blog/taobao-sales-19-billion-bonanza/">Chris West</a></cite>
  </footer>
</blockquote>

> Curabitur blandit tempus porttitor. Nullam quis risus eget urna mollis ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.

Good afterble constanoon, this sweet hongi is as bung as a stuffed morepork. Mean while, in the marae, Dr Ropata and Hairy Maclary from Donaldson's Dairy were up to no good with a bunch of bloody troties.

### Inline HTML elements

HTML defines a long list of available inline tags, a complete list of which can be found on the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/HTML/Element).

- **To bold text**, use `<strong>`.
- *To italicize text*, use `<em>`.
- Abbreviations, like <abbr title="HyperText Markup Langage">HTML</abbr> should use `<abbr>`, with an optional `title` attribute for the full phrase.
- Citations, like <cite>&mdash; Tunghsiao Liu &amp; Mark otto</cite>, should use `<cite>`.
- <del>Deleted</del> text should use `<del>` and <ins>inserted</ins> text should use `<ins>`.
- Superscript <sup>text</sup> uses `<sup>` and subscript <sub>text</sub> uses `<sub>`.

Most of these elements are styled by browsers with few modifications on our part.

Maui and his rough as guts piece of pounamu, what a stink buzz. Bro, quater-acre patches are really naff good with bung mates, aye. You have no idea how beached as our random kais were aye. Every time I see those beautiful lengths of number 8 wire it's like Castle Hill all over again aye, do you happen to have a bucket or a hose bro?

### Code Highlighting
Code highlighting demo, powered by Pygments. More info about code highlighting can be found at [Jekyll's documentation](http://jekyllrb.com/docs/templates/#code-snippet-highlighting).

```ruby
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
```

```css
/* Background color function */
.code-bg (@v) when (lightness(@v) >= 50%) {
  @return-bg: mix(#000, lighten(@v, 30%), 10%);
}
.code-bg (@v) when (lightness(@v) < 50%) {
  @return-bg: mix(#fff, darken(@v, 10%), 70%);
}
```

### Headings

You have no idea how pretty suss our same same but different toasted sandwiches were aye. Every time I see those carked it keas it's like the dairy all over again aye, you don't know his story, bro. Anyway, Hairy Maclary from Donaldson's Dairy is just Mrs Falani in disguise, to find the true meaning of life, one must start frying up with the hangi, mate. After the rugby ball is jumped the ditch, you add all the stink girl guide biscuits to the trotie you've got yourself a meal.

#### Headings

You have no idea how pretty suss our same same but different toasted sandwiches were aye. Every time I see those carked it keas it's like the dairy all over again aye, you don't know his story, bro. Anyway, Hairy Maclary from Donaldson's Dairy is just Mrs Falani in disguise, to find the true meaning of life, one must start frying up with the hangi, mate. After the rugby ball is jumped the ditch, you add all the stink girl guide biscuits to the trotie you've got yourself a meal.

##### Headings

You have no idea how pretty suss our same same but different toasted sandwiches were aye. Every time I see those carked it keas it's like the dairy all over again aye, you don't know his story, bro. Anyway, Hairy Maclary from Donaldson's Dairy is just Mrs Falani in disguise, to find the true meaning of life, one must start frying up with the hangi, mate. After the rugby ball is jumped the ditch, you add all the stink girl guide biscuits to the trotie you've got yourself a meal.

###### Headings

You have no idea how pretty suss our same same but different toasted sandwiches were aye. Every time I see those carked it keas it's like the dairy all over again aye, you don't know his story, bro. Anyway, Hairy Maclary from Donaldson's Dairy is just Mrs Falani in disguise, to find the true meaning of life, one must start frying up with the hangi, mate. After the rugby ball is jumped the ditch, you add all the stink girl guide biscuits to the trotie you've got yourself a meal.

```
### H3 Heading
#### H4 Heading
##### H5 Heading
###### H6 Heading
```

### Tables

Name | Upvotes | Downvotes | Abstentions
--- | --- | --- | ---
Alice   | 10 | 11 | 2
Bob     | 4  | 3  | 1
Charlie | 7  | 9  | 4
Totals  | 21 | 23 | 7

### Gists via GitHub Pages

Use the `gist` tag to easily embed a GitHub Gist onto your site. This works with public or secret gists:

{% gist sparanoid/55c3dd64f94881017a7b gist.md %}

### Unique Post Styling

You can simply use `css` key to your post YAML front-matter head:

```
---
layout: post
title: Welcome to Almace Scaffolding
css: |
  body {
    font-size: 1.8vw;
  }
---
```

### Browser Frame

<p class="browser"><img src="http://rsrc.sparanoid.com/delicious.com.png" alt="Delicious Preview" class=nointense></p>

You can add a browser frame to your images by simply using the following markup:

```html
<p class="browser">
  <img src="http://sparanoid.com/photo.jpg" alt="Image">
</p>
```

Please note that you can't apply CSS classes in Markdown, so you have to use HTML markup.

### [intense.js](http://github.com/tholman/intense-images) Support

![Moonstruck Princess Extended - Red](http://rsrc.sparanoid.com/moonstruck-princess-ext-red.jpg)

Add the folloing setting to your post [front-matter field](http://jekyllrb.com/docs/frontmatter/):

```
plugin: intense
```

Markdown markup:

```
![Image](http://sparanoid.com/photo.jpg)
```

Or simply use HTML:

```html
<p>
  <img src="http://sparanoid.com/photo.jpg" alt="Image">
</p>
```

`intense.js` is activated globally by default, if you want to disable this effect for specific image, you can simply apply `.nointense` CSS class to your `<img>`:

```html
<p>
  <img src="http://sparanoid.com/photo.jpg" class="nointense" alt="Image">
</p>
```

Please note that if you're using HTML markup, you should wrap your images into a `<p>` container.
