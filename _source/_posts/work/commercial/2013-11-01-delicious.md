---
layout: post
title: Delicious.<wbr>com
category: work
tag: commercial
link: http://delicious.com/
scheme-text: "#0062c6"
scheme-link: "#fff"
scheme-hover: "#00edff"
scheme-code: "#32d5db"
scheme-bg: "#39f"
plugin: slider
---

<div class=txt>
  <p><a href="http://delicious.com/">Delicious</a> (aka. del.icio.us) is a social bookmarking web service for storing, sharing, and discovering web bookmarks that first launched back in 2003. In 2005 it was acquired by Yahoo and later sold to AVOS Systems Inc. The website’s design hasn’t changed very much since its last redesign in 2011.</p>

  <p>This year, to celebrate its ten year anniversary, AVOS invited me to join the Delicious team, I do designs and front-end stuff, collaborated with the developer <a href="http://sunng.info/">Ning Sun</a> (<a href="{% post_url /work/commercial/2012-12-13-readwise %}/">again</a>) from AVOS on this project.</p>

  <div class="flexslider">
    <ul class="slides">
      <li>
        <p><img src="{{ site.file }}/delicious.com-logo.png" alt="Delicious New Logo"></p>
        <p class="flex-caption">Delicious New Logo</p>
      </li>
      <li>
        <p><img src="{{ site.file }}/delicious.com-iconset.png" alt="Delicious Iconset"></p>
        <p class="flex-caption">Delicious Iconset</p>
      </li>
      <li>
        <p><img src="{{ site.file }}/delicious.com.png" alt="Delicious UI Preview"></p>
        <p class="flex-caption">Delicious UI Preview</p>
      </li>
      <li>
        <p class="browser"><img src="{{ site.file }}/delicious.com-homepage.png" alt="Delicious Landing Page"></p>
        <p class="flex-caption">Delicious Landing Page</p>
      </li>
    </ul>
  </div><!-- .flexslider -->

  <p>Some fun facts:</p>

  <ul>
    <li>Brand-new brighter version of Delicious logo. (Time took: 5 minutes)</li>
    <li>No images used on this project. all styles are served by a ~23 KB gzipped CSS file. Hum, okay, there’s only one icon font and some SVG graphics and&hellip;</li>
    <li>The new design is responsive, I even spent more time on the mobile viewport, or I can say, it’s a mobile-first design. Try it out on your iPhone, it works smooth and intuitive.</li>
    <li>Delicious logo is made of pure CSS.</li>
    <li>I didn’t write any vendor prefix for this project. (Or let me say: <a href="https://github.com/ai/autoprefixer">Autoprefixer</a> rocks).</li>
    <li>We use Application Cache to speed up the page load times.</li>
    <li>We use <a href="http://gruntjs.com/">Grunt</a>.</li>
    <li>I worked remotely (from home) for all these things.</li>
  </ul>
</div>
