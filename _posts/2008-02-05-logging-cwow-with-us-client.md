---
layout: post
title: Logging Chinese World of Warcraft with US Client
category: note
excerpt: Use US World of Warcraft client to login Chinese servers
---

<div class=txt>
<p class=note>本文作者已 <a href="/game/make-love-not-warcraft-something-about-me-and-wow/">徹底告別魔獸世界</a>，故本文永久停止更新。最後更新：2009-09-19</p>

<p class=note>NGA <del datetime="2009-07-24T19:58:20+00:00">同步更新帖</del> <a href="http://bbs.ngacn.cc/read.php?tid=1614456">在此</a>（ID 已被 Nuked，吐槽不能），注意：本文具有一定的時效性。最後更新：2009-07-25</p>

<p>已找到登陸方法，待更新</p>

<ol>
<li>網易 30 日開始的內測，國服從網易官網上下載的客戶端現在可以登陸上去了，但是無服務器，美服暫時無法連接上去，無法驗證版本</li>
<li>新的網易官網已經給出了 3.0.5.9689 升級到 3.1.3.9981 的補丁，總共 370 多兆，其它國家的 3.1.3 版本 build 爲 9947，又是一個中國特色的版本，理論上開服後完全可以用美服的 3.1.3 客戶端登陸閹割版國服，但還是老規矩，鑒于目前尚未開服，更新後如過悲劇了請後果自負吧</li>
<li>從六月份開始停服到現在，應該快開了，聽說開服後應該會升級到 3.1.3 版，那麽提前提供下更新後美服客戶端登陸國服的方法，也就是用美服的 3.1.3 客戶端直接登錄國服。需要提醒的是，目前並沒有官方消息稱開服後會是 3.1.3，升級後所造成的損失本人不負責</li>
<li>更新到了 WotLK，發現國服是 3.0.5 版本，超前了國外一步，簡單研究了下發現了用美服 3.0.3 上國服 3.0.5 的方法，在這裏說下。首先，如果 2.4.3 你一直在用美服的話，想成功升級到 3.0.3 是有難度的，新補丁在安裝時加入了對安裝路徑的判斷，對于安了多種語言客戶端的玩家來說會比較麻煩。所以個人意見是，備份好你的宏，截圖，插件(知道名字就行)，將之前安裝的版本卸載，全新安裝一份</li>
</ol>

<h3>下載</h3>
<p>思路是先用 BT 拖 WotLK 3.0.1 完整版，然後再一路小補丁升上去，根據此思路下載會用到這些文件：</p>

<ul>
<li>None → 3.0.1  (7.72 GB) - <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.1-enUS-dvd.torrent">Torrent1</a></li>
<li>3.0.1 → 3.0.2  (389 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.0.1-to-3.0.2-enUS-Win-Update-downloader.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.1-to-3.0.2-enUS-Win-Update-downloader.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.0.2/WoW-3.0.1.8874-to-3.0.2.9056-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/21421/World_of_Warcraft_v3.0.1_to_v3.0.2_USAus_Patch">HTTP2</a></li>
<li>3.0.2 → 3.0.3  (20 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.0.2.9056-to-3.0.3.9183-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.2.9056-to-3.0.3.9183-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.0.3/WoW-3.0.2.9056-to-3.0.3.9183-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/21996/World_of_Warcraft_v3.0.2_to_v3.0.3_USAus_Patch">HTTP2</a></li>
<li>3.0.3 → 3.0.8  (51 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.0.3.9183-to-3.0.8.9464-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.3.9183-to-3.0.8.9464-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.0.8/WoW-3.0.3.9183-to-3.0.8.9464-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/23610/World_of_Warcraft_3.0.3_to_3.0.8_USAus_Upgrade_Patch">HTTP2</a></li>
<li>3.0.8 → 3.0.8a  (7 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.0.8.9464-to-3.0.8.9506-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.8.9464-to-3.0.8.9506-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.0.8/WoW-3.0.8.9464-to-3.0.8.9506-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/23835/World_of_Warcraft_3.0.8_to_3.0.8a_USAus_Upgrade_Patch">HTTP2</a></li>
<li>3.0.8a → 3.0.9  (10 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.0.8.9506-to-3.0.9.9551-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.8.9506-to-3.0.9.9551-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.0.9/WoW-3.0.8.9506-to-3.0.9.9551-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/24057/World_of_Warcraft_3.0.8a_to_3.0.9_USAus_Upgrade_Patch">HTTP2</a></li>
<li>3.0.9 → 3.1.0  (740 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.0.9.9551-to-3.1.0.9767-enUS-downloader.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.0.9.9551-to-3.1.0.9767-enUS-downloader.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.1.0/WoW-3.0.9.9551-to-3.1.0.9767-enUS-Win.zip">HTTP1</a> / <a href="http://games.on.net/file/25794/World_of_Warcraft_US_3.0.9__3.1.0_USAUS_Patch">HTTP2</a></li>
<li>3.1.0 → 3.1.1  (8 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.1.0.9767-to-3.1.1.9806-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.1.0.9767-to-3.1.1.9806-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.1.1/WoW-3.1.0.9767-to-3.1.1.9806-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/25955/World_of_Warcraft_3.1.0__3.1.1_USAUS_Patch">HTTP2</a></li>
<li>3.1.1 → 3.1.1a  (7 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.1.1.9806-to-3.1.1.9835-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.1.1.9806-to-3.1.1.9835-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.1.1/WoW-3.1.1.9806-to-3.1.1.9835-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/26090/World_of_Warcraft_USAUS_v3.1.1__v3.1.1a_Patch">HTTP2</a></li>
<li>3.1.1a → 3.1.2  (15 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.1.1.9835-to-3.1.2.9901-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.1.1.9835-to-3.1.2.9901-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.1.2/WoW-3.1.1.9835-to-3.1.2.9901-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/26626/World_of_Warcraft_USAus_v3.1.1a__v3.1.2_Patch">HTTP2</a></li>
<li>3.1.2 → 3.1.3  (7 MB) - <a href="http://a.wirebrain.de/wow/torrent/WoW-3.1.2.9901-to-3.1.3.9947-enUS-patch.torrent">Torrent1</a> / <a href="{{ site.file }}/download/wow-torrent/WoW-3.1.2.9901-to-3.1.3.9947-enUS-patch.torrent">Torrent2</a> / <a href="http://a.wirebrain.de/wow/patches/3.1.3/WoW-3.1.2.9901-to-3.1.3.9947-enUS-patch.exe">HTTP1</a> / <a href="http://games.on.net/file/26999/World_of_Warcraft_USAus_v3.1.2__v3.1.3_Patch">HTTP2</a></li>
</ul>

<p><strong>必要的補充與說明</strong>：</p>
<ul>
<li>上述文件大小都爲估計值</li>
<li>下載地址推薦度：Torrent1 > Torrent2 > HTTP1 > HTTP2</li>
<li>Torrent 方式下載建議使用 <a href="http://www.utorrent.com/">&micro;Torrent</a>，遠離 leecher</li>
<li>3.0.1 完整版我持續供了一年多的源，爲保證其健康向上的茁壯成長，建議下完後繼續供源一段時間，不強求</li>
<li>games.on.net 的資源 (HTTP2) 會有進程限制，下載時盡量避免多次暫停</li>
</ul>

<h3>准備安裝</h3>
<p>全部下載完畢後，大約會有 8.9 GB。建議在安裝前驗證下載的文件，否則當你安裝到了一半發現文件出錯時會後悔的。這裏我建議使用 <a href="http://www.beeblebrox.org/hashtab/">HashTab</a> 來驗證。安好 HashTab 後，右鍵點擊文件，查看 <strong>屬性</strong> 即可檢查文件的 Hash 值</p>

<p><strong>Hash 值列表 (CRC32)</strong></p>
<ul>
<li>WotLK Install\Installer Tome.mpq <code>D3EF279D</code></li>
<li>WotLK Install\Installer Tome 2.mpq <code>1E133CD2</code></li>
<li>WotLK Install\Installer Tome 3.mpq <code>FE1BE913</code></li>
<li>WotLK Install\Installer Tome 4.mpq <code>95210D06</code></li>
<li>WotLK Install\Installer Tome 5.mpq <code>7924A8D6</code></li>
<li>WoW-3.0.1.8874-to-3.0.2.9056-enUS-patch.exe <code>4A6B9A56</code></li>
<li>WoW-3.0.2.9056-to-3.0.3.9183-enUS-patch.exe <code>1D421FB4</code></li>
<li>WoW-3.0.3.9183-to-3.0.8.9464-enUS-patch.exe <code>545AE2E2</code></li>
<li>WoW-3.0.8.9464-to-3.0.8.9506-enUS-patch.exe <code>42DB1C45</code></li>
<li>WoW-3.0.8.9506-to-3.0.9.9551-enUS-patch.exe <code>91958AE0</code></li>
<li>WoW-3.0.9.9551-to-3.1.0.9767-enUS-Win.zip <code>8ADF1438</code></li>
<li>WoW-3.1.0.9767-to-3.1.1.9806-enUS-patch.exe <code>23D582F3</code></li>
<li>WoW-3.1.1.9806-to-3.1.1.9835-enUS-patch.exe <code>A58E00CB</code></li>
<li>WoW-3.1.1.9835-to-3.1.2.9901-enUS-patch.exe <code>EA6E823F</code></li>
<li>WoW-3.1.2.9901-to-3.1.3.9947-enUS-patch.exe <code>FEC90338</code></li>
</ul>

<p>值對不上的重新下載，沒問題的該解包的解包，該執行的執行，按照上面對應的列表順序安裝即可</p>

<h3>配置文件、字體修改</h3>
<p>從 3.0.3 開始配置文件已經徹底舍棄 <code>[WoWRoot]\realmlist.wtf</code> 了，所以根本不需要這個文件，說用改這個文件的也是錯誤的說法。目前 WoW 會調用 <code>[WoWRoot]\WTF\Config.wtf</code> 爲配置文件。<code>[WoWRoot]\Data\enUS\realmlist.wtf</code> 爲服務器模板文件(這是美服登陸國服的關鍵)</p>

<p class=note>下述修改方法爲九城時期的服務器設置，<del datetime="2010-08-09T19:32:51+00:00">網易的設置請持續關注本文</del></p>

<p>用文本編輯器打開 <code>[WoWRoot]\Data\enUS\realmlist.wtf</code>，將其中的 <code>set realmlist us.logon.worldofwarcraft.com</code> 那項改爲 <code>set realmlist cn*.grunt.wowchina.com</code>，* 代表你所在的大區，比如六區爲 <code>set realmlist cn<em>6</em>.grunt.wowchina.com</code></p>

<h3>替換 Wow.exe</h3>
<p>先將 3.1.3.9947 的原版 Wow.exe 備份下，就叫 Wow-en.exe 好了，然後從下列地址下載 3.1.3.9981 版本的 Wow.exe，複制到遊戲根目錄即可</p>

<p class=note>下載鏈已失效，本站不會再提供下載</p>
<p class=download><a href="{{ site.file }}/download/WoW.exe-3.1.3.9981.7z">WoW.exe-3.1.3.9981.7z</a> / <a href="{{ site.file }}/download/WoW.exe-3.1.3.9981.7z">WoW.exe-3.0.5.9869.7z</a></p>

<h3>字體修改</h3>
<p>到目前爲止已經可以登錄上了，但是這樣遊戲中出現的中文都會是亂碼。下面要做的就是下載一份中文字體，將它們優先載入，美服客戶端的字體和國服的不大一樣，還是以前的字體對應，沒有<del datetime="2009-07-10T17:38:41+00:00">九城</del>和方正亂搞的那一說：</p>

<ul>
<li><code>FRIZQT__.TTF</code> - 主界面字體</li>
<li><code>ARIALN.TTF</code> - 是聊天字體</li>
<li><code>MORPHEUS.ttf</code> - 郵件、任務字體</li>
<li><code>skurri.ttf</code> - 傷害字體</li>
</ul>

<p>我目前使用的是自己修改的微軟雅黑 + Yanone Kaffeesatz 英文字體，如果你沒找到好字體的話，可以試試它，<a href="/work/msyhwow/">點擊這裏</a> 了解該字體的詳細信息</p>

<h3>FAQ</h3>
<p>把這個放到了最後說，這裏有一點要注意的，就是登錄的時候要把左下角的 Show Launcher 選項卡給去掉，以後登錄直接運行 <code>Wow.exe</code> 即可，並且界面上可以保存用戶名，免得每次都要重新輸入用戶名的麻煩。美服客戶端的幾個缺點：在用戶選擇界面那裏無法顯示遊戲剩余時間，所以只能到<del datetime="2009-07-10T17:18:52+00:00">九城</del>網易通行證裏去看；無法建立中文名稱的競技場戰隊；無法進入中文名的自建頻道。至于插件，美服客戶端比國服能用的多多了，而國服用的基本都可以在美服客戶端上用。當然你也可以試試我制作的插件包：<a href="http://code.google.com/p/sparanoid/">Sparanoid's UI (已停止更新)</a></p>
</div>