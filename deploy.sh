#!/bin/bash
jekyll --no-server --no-auto && rsync -avz --delete --exclude=static/css/a.css --exclude=lab /Users/sparanoid/dropbox/sparanoid-web/sparanoid.com/jekyll/ root@209.114.36.40:/srv/www/sparanoid.com/public_html/
