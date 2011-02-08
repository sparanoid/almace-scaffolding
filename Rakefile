desc 'Build and deploy'
task :default do
  sh 'jekyll --no-server --no-auto && rsync -avz --delete --exclude=static/css/a.css --exclude=lab _site/ root@sparanoid.com:/srv/www/sparanoid.com/public_html/'
end