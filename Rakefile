desc 'Build and deploy'
task :default do
  sh 'jekyll --no-server --no-auto && rsync -avz --delete --exclude=static/css/a.css --exclude=lab /Users/sparanoid/dropbox/sparanoid-web/sparanoid.com/jekyll/ root@sparanoid.com:/srv/www/sparanoid.com/public_html/'
end
