---
layout: post
title: iTunes Artwork Grabber
category: work
tag: project
head: |
  <link rel="chrome-webstore-item" href="https://chrome.google.com/webstore/detail/pjdeblccplohlgedbefopohaedodcgci">
---

> (Yet Another) iTunes Artwork Grabber

## Intro

Get high-res artwork for apps, music, books, movies, TV shows, podcasts and more, all types supported. Works with Safari, Google Chrome, and Greasemonkey / Tampermonkey / Scriptish / etc.

## Supported Types

- iOS app icons
- OS X app icons
- Music album covers
- Book covers
- Movie posters
- TV show covers
- Podcast covers
- iTunes U resource covers
- Audiobook covers

## Unsupported Types

- Music video thumbnails

## Demo

Try this fancy [video demo](https://www.youtube.com/watch?v=8NVyzKb7VIY).

## Downloads

<div class="largetype">
  <div><a href="http://github.com/sparanoid/itunes-artwork-grabber/releases">Add to Safari</a></div>
  <div><a href="#!" onclick="chrome.webstore.install()" id="install-button" disabled>Add to Chrome</a></div>
  <div><a href="http://greasyfork.org/en/scripts/8947-itunes-artwork-grabber-by-tunghsiao-liu">Download via Greasy Fork</a></div>
  <div><a href="http://openuserjs.org/scripts/sparanoid/iTunes_Artwork_Grabber_by_Tunghsiao_Liu">Download via OpenUserJS</a></div>
  <div><a href="http://github.com/sparanoid/itunes-artwork-grabber">View source at GitHub</a></div>
</div>

## Love this?

Please consider [buying me a cup of coffee]({{ '/donate/' | prepend: site.base }}).

<script>
+function update_install_button() {
  var install_button = document.getElementById('install-button');
  install_button.removeAttribute(chrome.app.isInstalled ? "onclick" : "disabled");
}();
</script>
