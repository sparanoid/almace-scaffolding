---
layout: post
title: Tianjin Project
category: work
excerpt: A Detailed Introduction to Municipality of Tianjin
thumb: tianjin-project.jpg
---

<div class=txt>
<p><img src="{{ site.file }}/tianjin-project.png" alt="A Graduate Work from Tunghsiao Liu / A Detailed Introduction to Municipality of Tianjin"></p>
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