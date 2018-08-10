---
layout: post
title: Markdown Features Test
category: note
tags: miscellaneous
---

## Indented Code Blocks

    def show
      @widget = Widget(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @widget }
      end
    end

## Liquid Tag with `linenos` Support

{% highlight ruby linenos %}
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
{% endhighlight %}

## GFM Code Blocks (`fenced_code_blocks`)

```css
/* Background color function */
.code-bg (@v) when (lightness(@v) >= 50%) {
  @return-bg: mix(#000, lighten(@v, 30%), 10%);
}
.code-bg (@v) when (lightness(@v) < 50%) {
  @return-bg: mix(#fff, darken(@v, 10%), 70%);
}
```

### SmartyPants

"Aha! What's up, man?" -- Jony said.

## Tables

Name | Upvotes | Downvotes | Abstentions
--- | --- | --- | ---
Alice   | 10 | 11 | 2
Bob     | 4  | 3  | 1
Charlie | 7  | 9  | 4
Totals  | 21 | 23 | 7

## Intra-emphasis

foo_bar_baz

## Auto-link

https://sparanoid.com/

## Strikethroughs

This is ~~good~~ bad.

## Space after Headers

###This is not a header.

## Superscripts

This is the 2^(nd) time.

## Footnotes

This[^1] is[^2] a sentence[^3].

## ID 日本語タイトル

Expected id should be `id-ri-ben-yu-taitoru`.

## ID 中文標題

Expected id should be `id-zhong-wen-biao-ti`.

[^1]: Lorem lean startup ipsum **product market fit customer development** acquihire technical cofounder. User engagement A/B testing shrink a market venture capital pitch deck. Social bookmarking group buying [crowded market](#) pivot onboarding freemium prototype ping pong. Early stage disruptive ecosystem community outreach dynamic location based strategic investor.

[^2]: [An Important Announcement](https://web.archive.org/web/20160425094356/http://blog.readability.com:80/2012/06/announcement/) by Richard Ziade at Readability

[^3]: Good afterble constanoon, this sweet hongi is as bung as a stuffed morepork. Mean while, in the marae, Dr Ropata and Hairy Maclary from Donaldson's Dairy were up to no good with a bunch of bloody troties.
