---
layout: post
title: foobar2000 - MonoLite Plus
category: work
tag: project
excerpt: A foobar2000 theme based on Columns UI
thumb: monolite-plus-large.jpg
scheme-text: "#9d162e"
scheme-link: "#ffbdbd"
scheme-hover: "#ffd18c"
scheme-code: "#24ebdb"
scheme-bg: "#f1504d"
---

<div class=txt>
  <p><img src="{{ site.file }}/monolite-plus-04.jpg" alt="MonoLite Plus"></p>

  <p class=note>Lastest Version: <strong>0.4.3</strong> for foobar2000 1.0 / <strong>0.2</strong> for foobar2000 0.9.6.9</p>

  <p class=note>0.4.* 版本的 Last.fm 同步功能可能會在退出 foobar2000 時隨機出現錯誤提示，但不會影響正常使用</p>

  <h3>什麽是 MonoLite Plus？</h3>

  <p>MonoLite Plus 是一款基于 <a href="http://yuo.be/columns.php">Columns UI</a> 組件創建的 <a href="http://www.foobar2000.org/">foobar2000</a> 皮膚</p>

  <h3>與原版 MonoLite 有什麽不同？</h3>

  <ul>
    <li>增加歌詞顯示功能，支持自動下載歌詞</li>
    <li>增加藝術家簡介功能，信息來自 Last.fm</li>
    <li>集成 Last.fm 同步功能，支持點擊圖標增加 Love 曲目</li>
    <li>增加多種列表顯示模式（普通、<del datetime="2010-01-11T12:48:16+00:00">緊湊</del>、大圖標、小圖標等）</li>
    <li>專輯標題樣式美化，增加陰影效果，修改字體</li>
    <li>多處界面細節調整</li>
  </ul>

  <p>
  <strong>MonoLite Plus 0.4.* 界面截圖：</strong>
    <a href="{{ site.file }}/monolite-plus-04-01.png">#1</a>
    <a href="{{ site.file }}/monolite-plus-04-02.png">#2</a>
  <br>
  <strong>MonoLite Plus 0.2 / 0.3.* 界面截圖：</strong>
    <a href="{{ site.file }}/monolite-plus-02-01.png">#1</a>
    <a href="{{ site.file }}/monolite-plus-02-02.png">#2</a>
    <a href="{{ site.file }}/monolite-plus-02-03.png">#3</a>
    <a href="{{ site.file }}/monolite-plus-02-04.png">#4</a>
    <a href="{{ site.file }}/monolite-plus-02-05.png">#5</a>
    <a href="{{ site.file }}/monolite-plus-02-06.png">#6</a>
    <a href="{{ site.file }}/monolite-plus-02-07.png">#7</a>
  <br>
  <strong>MonoLite Plus 0.1 界面截圖：</strong>
    <a href="{{ site.file }}/monolite-plus-01.png">#1</a>
    <a href="{{ site.file }}/monolite-plus-02.png">#2</a>
    <a href="{{ site.file }}/monolite-plus-03.png">#3</a>
  </p>

  <h3>MonoLite Plus 安裝向導 (Portable 模式)</h3>

  <ul>
    <li>複制壓縮包中所有文件到 fooobar2000 文件夾</li>
    <li>運行 foobar2000 並選擇 Columns UI</li>
    <li>依次打開 Preferences &#8250; Display &#8250; Columns UI，然後導入皮膚 <code>file mono_lite.fcl</code> <em>（foobar2000 1.0 無需此設置）</em></li>
    <li>大功告成</li>
  </ul>

  <h3>MonoLite Plus 安裝向導 (標准模式)</h3>

  <ul>
    <li>將配置文件位置修改爲應用程序安裝目錄，位于選項中的 General 處修改</li>
    <li>這樣會重制你的設置，因此修改爲 portable 後請手動轉移原配置到新目錄</li>
    <li>然後照做 Portable 模式下的安裝方法</li>
  </ul>

  <h3>Last.fm 功能安裝向導</h3>

  <ul>
    <li>首先執行 monolite_lastfm_install.bat 文件，相關組件會自動安裝</li>
    <li>在心形圖標的右鍵菜單處輸入用戶名與 API 密鑰</li>
    <li>如沒有 API 密鑰則需要從 <a href="http://www.last.fm/api/account">這裏</a> 申請</li>
    <li>運行 foobar2000 並在設置窗口中的 Tools / Audioscrobbler 與 Tools / Soft Playlists 面板中輸入您的帳戶信息</li>
  </ul>

  <h3>Last.fm 功能移除向導</h3>

  <ul>
    <li>退出 foobar2000，然後運行 monolite_remove_lastfm.bat，所有的相關文件會被移動到 monolite_backup 文件夾</li>
    <li>如果哪天突然想用 Last.fm 了，則運行 monolite_restore_lastfm.bat 然後菜單中選回 Monolite Plus with Last.fm 所有的相關文件及配置即可還原</li>
    <li>選中菜單中的 View / Layout / MonoLite Plus (Without Last.fm Icon) 可以去掉其圖標</li>
  </ul>

  <h3>會自動生成的內容</h3>

  <ul>
    <li><code>%foobar_dir%\lyrics\*</code> - 歌詞存放目錄 (foo_uie_lyrics.dl)</li>
    <li><code>%foobar_dir%\lastfm\*</code> - 藝術家、專輯圖片 (foo_uie_biography.dll)</li>
    <li><code>%foobar_dir%\customdb_sqlite.db</code> - Last.fm 數據庫 (foo_customdb.dll)</li>
  </ul>

  <p>如果不想自動生成這些文件，可在設置中禁用</p>

  <h3>使用技巧</h3>

  <ul>
    <li>左鍵雙擊專輯分類=全選該分類下的曲目；中鍵單擊曲目=打開曲目屬性窗口</li>
    <li>音樂庫中中鍵點擊某項=將該項目添加到新播放列表並播放</li>
    <li>通過右鍵菜單 Tagging / Quick Tagger / Set &lt;rating&gt; to... 可以爲曲目評星，也可在設置界面中爲此功能綁定快捷鍵，例如 ALT 1-5，ALT + 6 取消評星</li>
    <li>隱藏菜單欄、狀態欄會有更好的視覺效果。菜單欄可以在需要的時候點擊右上角的按鈕顯示</li>
    <li>在播放列表任意位置點擊右鍵，即可修改 Sort 與 Group by 類型</li>
    <li>當修改了 Group by 類型後，專輯封面大小會發生變化，導致專輯封面顯示模糊，此時右鍵點擊列表任意位置選 Refresh all 即可</li>
    <li>建議 <a href="{{ site.file }}/monolite-plus-04.png">如圖修改</a> 快捷鍵設置，從此敲擊空格即可定位到正在播放的曲目</li>
  </ul>

  <h3>Windows XP 用戶</h3>

  <ul>
    <li>需要安裝 Segoe UI 才能顯示正確字體，字體請從 <del datetime="2010-10-17T08:34:52+00:00">下方下載區下載</del> 網上自行搜索</li>
  </ul>

  <h3>聲明</h3>

  <ul>
    <li>MonoLite 原作者爲 fanco86 <a href="http://fanco86.deviantart.com/art/MonoLite-122756120">#</a></li>
    <li>MonoLite Plus 由 Sparanoid 修改 <a href="http://junior-spirit.deviantart.com/art/MonoLite-Plus-144505359/">#</a></li>
    <li>MonoLite Plus 爲 MonoLite 的修改版</li>
    <li>Last.fm WSH Panel 代碼由 marc2003 編寫 <a href="http://www.hydrogenaudio.org/forums/index.php?showtopic=76772">#</a></li>
    <li>光盤圖標由 PaulEnsane 制作 <a href="http://paulensane.deviantart.com/art/CD-Icon-115783933">#</a></li>
    <li>心形圖標由 Tango Desktop Project 制作 <a href="http://tango.freedesktop.org/Tango_Desktop_Project">#</a></li>
    <li>感歎號圖標由 Yusuke Kamiyamane 制作 <a href="http://www.pinvoke.com/">#</a></li>
    <li>媒體庫查看方式代碼基于 hydrogenaudio.org 論壇的 2E7AH 修改 <a href="http://www.hydrogenaudio.org/forums/index.php?s=&showtopic=68552&view=findpost&p=684400">#</a></li>
  </ul>

  <p class=note>該主題基于 <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/deed.zh">署名-非商業性使用-相同方式共享 3.0 發布</a></p>

  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-043.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-042.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-041.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-04.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-031.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-03.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-02.7z</p>
  <p class=download><a href="{{ site.file }}/download/monolite-plus-043.7z">Download</a> / monolite-plus-01.7z</p>
</div>