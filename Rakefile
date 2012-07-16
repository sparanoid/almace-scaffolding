# Settings
ssh_user = 'root@sparanoid.com'
remote_root = '/srv/www/sparanoid.com/public_html'
exclude_files = '--include=*.css --exclude=*.ai --exclude=*.psd --exclude=lab --exclude=*.less'

desc 'Build and deploy'
task :default do
  puts '>>> Deploying to VPS'
  sh "jekyll --no-server --no-auto && rake minify && rsync -avz --delete #{exclude_files} _site/ #{ssh_user}:#{remote_root}"
  puts '>>> Deployed.'
end

desc 'Sync static files to S3'
# task :s3 => [:default] do
task :s3 do
  puts '>>> Sync static files to S3...'
  sh "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' ~/dropbox/sparanoid-web/static.sparanoid.com/ s3://sparanoid/"
  puts "Sync completed"
end

desc 'Minified HTML'
task :minify do
  puts '>>> Minifying HTML'
  sh "java -jar _build/htmlcompressor.jar -r --type html --remove-intertag-spaces --remove-quotes --remove-http-protocol --remove-https-protocol --compress-js --compress-css -o _site _site"
  sh "java -jar _build/htmlcompressor.jar -r --type xml -o _site _site"
  puts '>>> Minified.'
end