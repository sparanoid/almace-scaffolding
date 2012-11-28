# General settings
ssh_user = 'root@sparanoid.com'
remote_root = '/srv/www/sparanoid.com/public_html'
exclude_files = '--exclude=lab'

# Default task, build static HTML pages and upload to my server with rsync
desc 'Build and deploy'
task :default do
  puts '>>> Deploying to VPS'
  sh "jekyll --no-server --no-auto && rake minify && rsync -avz --delete #{exclude_files} _site/ #{ssh_user}:#{remote_root}"
  puts '>>> Deployed.'
end

# Sync static files to Amazon S3
desc 'Sync static files to S3'
# task :s3 => [:default] do
task :s3 do
  puts '>>> Sync static files to S3...'
  sh "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' ~/dropbox/sparanoid-web/static.sparanoid.com/ s3://sparanoid/"
  puts "Sync completed"
end

# Minify HTML ouput for better performance
desc 'Minified HTML'
task :minify do
  puts '>>> Minifying HTML'
  sh "java -jar _build/htmlcompressor.jar -r --type html --remove-intertag-spaces --remove-quotes --remove-http-protocol --remove-https-protocol --compress-js --compress-css -o _site _site"
  sh "java -jar _build/htmlcompressor.jar -r --type xml -o _site _site"
  # CSS minification workaround. YUI Compressor has a bug dealing with SVG data URI, don't use
  # More information: http://yuilibrary.com/projects/yuicompressor/ticket/2528159
  # sh "java -jar _build/yuicompressor.jar --type css _site/css/a.css -o _site/css/a.css"
  sh "perl -i -p -e 's/\n//' ./_site/css/a.css"
  puts '>>> Minified.'
end