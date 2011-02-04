#!/bin/bash
jekyll --no-server --no-auto && rsync -avz --delete /Users/sparanoid/dropbox/sparanoid-web/sparanoid.com/-/ root@209.114.36.40:/srv/www/sparanoid.com/public_html/-/