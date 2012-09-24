---
layout: post
title: Tianjin Project
category: work
tag: design
excerpt: A Detailed Introduction to Municipality of Tianjin
thumb: tianjin-project.jpg
---

<div class=txt>
<p><img src="{{ site.file }}/tianjin-project.png" alt="A Graduate Work from Tunghsiao Liu / A Detailed Introduction to Municipality of Tianjin"></p>

<p class=note>Now this project is featured on <a href="/work/tianjin-project-wef/">The World Economic Forum - Tianjin Davos 2012</a>.</p>
</div>

<div class=txt>
  <h3>Book Preview</h3>
</div>
<p><img src="{{ site.file }}/tianjin-project-preview-01.jpg" alt="Tianjin Project Book Preview #1"></p>
<p><img src="{{ site.file }}/tianjin-project-preview-02.jpg" alt="Tianjin Project Book Preview #2"></p>
<p><img src="{{ site.file }}/tianjin-project-preview-03.jpg" alt="Tianjin Project Book Preview #3"></p>
<p><img src="{{ site.file }}/tianjin-project-preview-04.jpg" alt="Tianjin Project Book Preview #4"></p>
<p><img src="{{ site.file }}/tianjin-project-preview-05.jpg" alt="Tianjin Project Book Preview #5"></p>
<p><img src="{{ site.file }}/tianjin-project-preview-merged.jpg" alt="Tianjin Project Book Preview #6"></p>

<div class=txt>
  <h3>Website Design</h3>
</div>
<p class=browser><a href="/lab/tianjin/"><img src="{{ site.file }}/tianjin-project-site.jpg" alt="Tianjin Project Website"></a></p>

<div class=txt>
  <h3>Promo Video</h3>
</div>
<iframe width="1280" height="720" src="http://www.youtube.com/embed/dk2Fg8WJ3-o?rel=0" frameborder="0" allowfullscreen></iframe>

<div class=txt>
<p>Created using iBooks Author, for iPad only, check out the project page <a href="/lab/tianjin/">here</a>.</p>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script>
// By Chris Coyier & tweaked by Mathias Bynens
$(function() {
  var $allVideos = $("iframe[src*='//www.youtube.com/embed']"),
      $fluidEl = $("body");
  $allVideos.each(function() {
    $(this)
      .data('aspectRatio', this.height / this.width)
      .removeAttr('height')
      .removeAttr('width');
  });

  $(window).resize(function() {
    var newWidth = $fluidEl.width();
    $allVideos.each(function() {
      var $el = $(this);
      $el
        .width(newWidth)
        .height(newWidth * $el.data('aspectRatio'));
    });
  }).resize();
});
</script>