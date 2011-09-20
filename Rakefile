desc 'Build and deploy'
task :default do
  sh 'jekyll --no-server --no-auto && rsync -avz --delete --exclude=*.ai --exclude=*.psd --exclude=assets/css/a.css --exclude=assets/css/feed.css --exclude=lab _site/ root@sparanoid.com:/srv/www/sparanoid.com/public_html/'
end