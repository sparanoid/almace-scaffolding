---
layout: post
title: Custom MIME Types for WEBrick
category: note
excerpt: Add custom MIME types when playing Jekyll /w WEBrick web server
---

<div class=txt>
<p>在 localhost 運行 Jekyll 的時候，WEBrick 不會給某些「未知」格式的文件設置 MIME，導致這些文件不能正常顯示，這時候可以修改配置：</p>

<code>nano /Users<wbr>/sparanoid<wbr>/.rvm<wbr>/rubies<wbr>/ruby-1.9.2-p180<wbr>/lib<wbr>/ruby<wbr>/1.9.1<wbr>/webrick<wbr>/httputils.rb</code>

<p>在 <code>DefaultMimeTypes</code> 中，添加：</p>

<code>"svg" => "image/svg+xml",</code>
</div>