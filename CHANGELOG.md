# Changelog

## Head

- Hide img alt
- Update post 'Project Railgun'
- Better Rakefile
- Add posts for newly released plugins.
- Update old post with 'img-headline'.
- Add `.reflist`, `.ref`, `.cite` for reference links in post
- Update post 'Tianjin Project'
- Update header for post 'Corner Bracket Lover'
- Add 'thumb' images for hidden posts from category 'Work'. The thumbnails I defined are mainly used by Twitter Cards meta
- Update posts for newly released plugins / theme
- Simplified Gemfile
- Better configuration for switching image assets URL
- Better file structure, fix empty space when a paragraph starts with some asian punctuation marks
- Add `:preview` task, experimental
- Better configuration file to control availability
- Update `::selection` style
- TL;DR
- Reset availability
- Remove `.work-list` in single post, update post navigation
- Simplify post navigation
- Retire accesskey
- Update browser style
- Remove useless posts
- Update post tag, remove some useless posts
- Add side projects section
- Make `twitter:description` a little bit longer than 200 letters, Twitter can handle it very well.
- Better template logic, minor tweaks
- Simplify template tags
- Upgrade Lazyload by @vvo to 1.0.0
- Use internal links instead of hardcoded links, read more about this specification at https://github.com/mojombo/jekyll/pull/369
- Update Jekyll to 0.12.0
- Add more description about default deploy task
- Initialize Lazyload as soon as it loads. props @vvo
- New post 'A List Apart 5.0'
- Add 'Donate' page
- Update text description for donate links
- Add exclude search list for Textmate
- Fix `site.url` for Twitter share button
- Update Jekyll to 0.12.1
- info@sparanoid.com -> t@sparanoid.com
- Remove post navigation
- newsletter.sparanoid.com instead of sparanoid.createsend.com
- Remove WebKit filter effect, not well supported on Retina Display
- Adds WebKit filter effect back
- Adds `.webkit-fix` hack to gain some performance and fix burry image using `-webkit-filter` on MacBook Pro with Retina display
- Remove `.webkit-fix` on body tag
- Remove unused post navigation CSS
- Adds.txt definition for 'Note' page
- Adds `.webkit-fix` for `:root`
- Updates `.index` background color for post 'Kai Series'
- Updates `Rakefile` with new path
- Adds new post ‘Kai Series’
- Compatible with Jekyll 1.*:
- Using directory-specified path for `post_url`
- Better configuration structure.
- Updates gitignore (`codekit-config.json` removed since it's no longer serving me)
- Remove support for `--file` flag

## 21 (December 10, 2012)

- New header design
- Better comments
- Increase nav menu links spacing, since we've compressed and removed white spaces for HTML output. we need to add more space between links. More info: http://stackoverflow.com/questions/588356/
- Wrap all width-sensitive elements into .wrapper, prepared for the upcoming header
- Simplify deploy script
- Update project name
- Add special header for homepage
- Better arrow hover color
- Better header background gradient
- Better template indent
- Larger header post title
- Add font family variable
- Try ORCA CDN created by @livid
- Unfix header height
- Add FlexSlider for some interactive posts
- Update pagination position
- Add comments for better understanding. Updated Twitter Cards code
- Better header condition
- Better comments
- Add HTML5 form validation support
- Change subscription pages to category 'store'
- Bump copyright year
- Better CSS selector performance
- Update some posts thumbnails
- Add a -webkit-filter effect for .work-list
- Add some narrow typefaces failback
- FlexSlider: pauseOnHover: true
- Fix .paginaton padding
- Add cutsom Jekyll support

## 20.1-finale

- Simplified feed templates
- Uses background-color in transition statement to avoid animation effect on logo
- Add role=announcement
- Simplified .gitignore file
- Fixed typo, props @disinfeqt
- lang="zh" -> lang=zh
- More specified Rakefile comment
- Update post WordPress Plugin - Quotmarks Replacer, better blockquote styles
- Update post WordPress Plugin - Quotmarks Replacer
- Update post WordPress Plugin - Quotmarks Replacer
- Better tweet button position
- Merge posts
- Tabs -> spaces
- Remote post contents on page Note
- Shortened post URL and title 'Lester’s Plugins in Chinese'
- Single quotes -> double quotes
- Update post 'Lester’s Plugins in Chinese'
- Add new post '3.1 Billion in a Day'
- Add Twitter Card support
- Update logo
- Remove useless CSS define
- Add image lazy load support, more info at https://github.com/vvo/lazyload
- Use nginx empty gif module instead of data URI to small generated HTML size, read more info about nginx empty gif module: http://wiki.nginx.org/HttpEmptyGifModule
- ∞ (&#8734) -> ▲ (&#9650)
- Revert "∞ (&#8734) -> ▲ (&#9650)"
- This reverts commit a28bb07f29e9966a65407c3a55f7913f18246b58.
- ∞ (&#8734) -> ▲ (&#9650)

## 20.1

- Convert Chinese posts to English
- Update post 'Tianjin Project'
- Update work-list appearance
- Fix work-list on iPhone landscape
- Update post thumbnaills
- Update post 'Font Zomnk'
- Update About page with microdata
- Fix typo
- Add .store style, embed SVG w/ data URI in LESS
- Added a workaround solution for yuicompressor bug, media query fix
- Remove lang variable. More post in English. Better hr styles with data attr.
- Fix feed-all.rss permalink
- Update ads code
- Update post 'Antiskill, Judgment Screensaver / Icon'
- Rakefile playing with YUICompressor
- Update post thumbnails style for works
- Update font, Add new post 'Tianjin Project × The World Economic Forum'
- Update post pubdate for 'Tianjin Project × The World Economic Forum'
- Update post 'Tianjin Project × The World Economic Forum'
- Update post thumbnail size in feed
- Better font size
- Update pagination position
- Add new post 'Safari 6 Loads Page Faster'
- Update clearfix method: http://nicolasgallagher.com/micro-clearfix-hack/
- Update comment for clearfix hack
- Simplified CSS and HTML code
- Inverted color for Error page
- Add tweet button, variables updated
- No more WOTY series
- Update decoration border, global body padding updated
- apple-touch-icon -> apple-touch-icon-precomposed
- HR description position update
- Update apple-touch-icon (precomposed)
- Update media query description
- Better media query, .tweet -> .btn
- Better media query again
- Revert "Update media query description"
- This reverts commit eea63e861514f1d89bf87588c73cbc0ce45477cf.
- Merge branch 'master' of github.com:sparanoid/sparanoid.com
- Reset "New page: Work List"
- Add site.url variable.
- Added subscription page and form
- sparanoid.createsend.com -> newsletter.sparanoid.com
- Update newsletter server URL newsletter.sparanoid.com -> sparanoid.createsend.com again for SSL support.
- Update post Tianjin Project series
- Update post Lucky Star Skin for QQ / Sogou Pinyin IME
- This is an elements centered version, with the following verbose changes:
- All elements are centered.
- Simpler page navigation
- Shorter post title for some articles, make them look better on small screen
- Simplified iOS media query
- Adds media query to detect different screen resolution for work-list
- Adds freelance status on homepage
- Uses site.email variable on About page
- Adds feed-note.atom and feed-work.atom (Temporary)
- Update .btn styles

## 20

- First commit prepared for v20
- Remove comments in LESS, work-list minor tweak, remove text-align hook in error page
- Remove WOTY specified styles and structures
- Font updated, index updated, colophon updated, pagination position updated, infinite symbol position updated
- Update logo size
- Bump version to 20
- Remove leftover font
- Post minor changes
- Remove charset meta tag
- Update pagination position, again
- Fix typo, props @lianghai
- No more .woty class for this version
- Update README.md
- Add slide effect on navigation
- Fix display: inline-block parsing error in Firefox for navigation
- Fix pagination position, probably the last time I fix it.
- Rewind to Safari compatible navigation, ignore Firefox users
- An experiment rotate menu layout
- An experiment mouseover menu layout
- Remove unused mixins
- Add text-align workaround for post with Chinese, props @lianghai
- Fix typo, props @GordianZ
- Better menu transition effect
- Better HTML output, just looks better
- Fix pagination position, oh...
- HTML markup update
- Media query, iOS ready
- Logo and text pixel perfection, props @vaia
- Add HTML compressor.rb by @mytharcher
- Removed HTML compressor.rg by @mytharcher. Use the easier way: htmlcompressor.jar and yuicompressor.jar in Rakefile for minify HTML output code, this can provide pretty HTML code for development and serve minified version for production. sweet.
- Remove useless HTML comment
- Arrange posts in category folder, fixed wrong post URL
- Update post "lindsay-koinaka 3.0"
- Fix navigation in error page
- Add .browser style for website post display
- Better title position
- Category update: add Design and Drawing tag for posts in category Work. more style changes for work list and .browser frame
- Update post thumbnails
- New post 'Big Typography Dynasty'
- Add Rakefile to repo, finally
- Remove deprecated tasks
- Update thumbnails size for Work posts
- Update .gitignore
- Add screenshot for Tianjin Project
- Update thumbnails size for Work posts, again
- Add current page style for iOS, update pagination position
- "Update thumbnails size for Work posts, again", again
- Add &#20; for htmlcompressor.jar
- Fix work-list for post
- Better title position
- Add section header for post 'Tianjin Project'
- Major changes for box models
- Clean up CSS
- Compress feeds
- Update h3 margin
- Remove whitespaces
- Add byline for Google Authorship, more information at http://support.google.com/webmasters/bin/answer.py?hl=en&answer=1408986
- Update complier path
- Update codename, bump to (real) version 20

## 19.3-finale

- Better pagination for Note section with post title
- Remove bottom gradient
- Add .download and .note icons
- Better svg height for Safari and iOS Safari
- Another icon position fix when download and note blocks are used at the same time
- Update post 'SlimBox & VoxGrowl'
- Update post '7-Zip Iconset Redesigned (Version 2)'
- Better font stacks order
- Add new post series: Word of the Year (WOTY)
- Remove white spaces and other jam
- Unified excerpts for posts. Update Atom feed structure.
- Update permalink symbol for Note
- Update page 'About'
- Color variables ready, invert version reader
- Ready for invert
- Add new post 'I Don’t “Get” Art'
- Better Atom feed structure, passed feed validation by w3.org
- Update feed structure
- Remove Safari preview hack, since there's a cool type here.
- Fix Atom feed, again
- Fix HTML entries
- Fix quote marks
- Update my great Error 404 page
- RSS feed minor change
- Better font styles handling / Add blockquote
- Add some old posts
- Update dead link for old post
- Add old artwork posts / Update quote marks
- Update post thumbs
- Update hover background color in image list in "work"
- Update HTML structure, Simplified link border-bottom logic
- Add old post 'iGoogle Theme - Somilody 2'
- Update page 'Note' structure
- Decrease .download and .note font-size
- Update pseudo classes for .work-list
- Update media query for better UX for iPhone users. Add @space variable to take care of all spaces.
- Darker blockquote symbol
- Simplify media query syntax
- Replace .a with role^=current
- role=current-page -> role=current
- Revert "role=current-page -> role=current"
- This reverts commit 17daf5330d4146d82826adb4629017c6a77fcf28.
- role=current-page -> role=current
- Add new post "“Free” Dribbble Invite"
- Update Word of the Year titles
- Refine CSS classes, remove unused styles, many minor fixes

## 19.3

- More logo staff
- Still more logo staff
- Remove logo animation
- No more <body>
- Remove duplicates
- Update logo
- Update thumbnails style
- Better line-height control
- Change feeds URLs
- Remove experimental staff
- Update post 'Moonstruck Princess'
- Add new post 'Tianjin Project'
- Change .txt width
- Update logo
- Update assets filename / Better CSS naming for assets / Clean up CSS
- Larger title
- Update pagination position for new larger title
- Fix pagination position on the iPhone
- Fix hgroup width
- Better styles order
- Make .txt max-width variable
- Add placeholder background for images in work list

## 19.2

- Remove ajaxify-html
- Add old posts
- Better title line-height
- Better typesetting for email address on mobile (small screen) device
- Anti SOPA
- Remove SOPA style
- Update CSS structure
- Update doctype
- Update link in post 'PaintStop Chinese Simplified for ZBrush 3.1 [Unofficial]'
- Make copyright year automatically update
- Update list decoration
- Clean .gitignore
- Configuration cleaned, typo fixed
- Remove humans.txt
- Simplified _config.yml
- Simplified _config.yml #2
- Add assistive text to RSS 1.0
- Fix RSS 1.0 validating error
- /feed/rss.xml -> /rss/index.xml
- Modify Safari preview page
- Change words for post 'WordPress Plugin - Quotmarks Replacer'
- Update license
- Update logo

## 19.1

- Logo updated
- Fix GitHub repo URL
- Add top transparent bar
- Add pagination
- Update ignore files
- Better top bar
- Update error page
- Update readme
- Update navigation padding
- Remove empty space
- Add translucent gradient at the bottom of the page
- Add navigator for category Work
- Better CSS logic
- Compressed apple-touch-icon.png
- Only use link when it's a external URL
- Removed useless vendor-free CSS styles
- Update post 'Path Menu Using CSS'
- Better feed output for posts with external links
- Add Store page
- Fix grammar for post 'Path Menu Using CSS'
- Add an arrow for external links in post page
- Update color scheme
- Remove leftovers
- Darker title
- Compressed CSS with YUI compressor
- Update CSS author comment
- Update favicon
- Remove useless space
- Better line-height for ad.
- Update code / pre color
- Add WebFont Loader by Google
- Manually rolled back to original font-face version
- Remove legacy font-face supports
- Better footer position
- Add Ajaxify with histroy.js and ajaxify-html5.js
- Remove fade effect, load script on demand
- Updatte ajaxify
- Remove fade effect again

## 19

- Upgrade to ver. 19, codename lindsayisgod

## 18-finale

- REMOVE </script> fix for Jekyll
- UPDATE font-family in image list
- UPDATE link border color
- UPDATE text block gradient
- UPDATE print and iPhone style
- UPDATE logo
- ADD text-rendering
- UPDATE logo
- UPDATE about page
- UPDATE error page
- FIX HTML markup minor changes
- REMOVE Yoggrt ads
- UPDATE image hover background-color
- ADD justified text-align and hyphens for post contents
- POST remove umbrella
- UPDATE post list styles
- POST add 'Path Menu Using CSS'
- FIX double slashes when a external link is defined in post.html
- Update logo
- Add BSA ads

## 18

- ADD v18 mockup
- REMOVE pagination for category NOTE
- UPDATE thumbnail images styles
- ADD media query for iOS
- UPDATE navigation
- UPDATE README.md
- UPDATE Atom feed
- POST remove 'Nessa'
- REMOVE styles for atom feed
- ADD RSS feed for exporting to WordPress
- UPDATE a:hover style
- ADD transition for a:hover style
- UPDATE font-family
- UPDATE always show ads
- UPDATE always show ads #2
- RENAME rss.xml -> index.rss.xml
- REMOVE category for RSS output, cause WordPress creates dummy categories.
- UPDATE pages
- UPDATE styles for v18

## 17-finale

- REMOVE dead GitHub links
- POST minor changes
- FIX Jekyll parsing error
- REMOVE Rakefile
- UPDATE paginator

## 17

- BUMP version to 17 from old repo

## 16

- BUMP version to 16 from old repo

## 15

- BUMP version to 15 from old repo

## 14

- ADD fonts back due to the lack support of Firefox
- ADD new webkit gradient style
- UPDATE font files to CloudFront
- UPDATE prepared for upcomming version
- UPDATE URL for easy development

## 1.1

- UPDATE file structures
- FIX navigation in index
- UPDATE HTML structure and CSS cleanup
- UPDATE index display settings
- UPDATE Atom output
- UPDATE Cloudfront files URL
- ADD error 404 page, UPDATE assets files url
- UPDATE host font files elsewhere
- UPDATE error page

## 1.0

- Initial release