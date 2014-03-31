---
layout: post
title: Welcome to Jekyll Scaffolding
category: note
---

<p>This is a Jekyll Scaffolding demo, you can view documentation and source code at <a href="https://github.com/sparanoid/jekyll-scaffolding">GitHub</a></p>

```ruby
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
```
