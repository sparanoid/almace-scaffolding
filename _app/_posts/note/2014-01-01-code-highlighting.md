---
layout: post
title: Code Highlighting
category: note
---

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

Name | Upvotes | Downvotes
--- | --- | ---
Alice   | 10 | 11
Bob     | 4  | 3
Charlie | 7  | 9
Totals  | 21 | 23
