# General settings
ssh_user      = 'root@sparanoid.com'
remote_root   = '/srv/www/sparanoid.com/public_html'
assets        = 'http://rsrc.sparanoid.com'
exclude_files = '--exclude=lab'

task :preview do
  system "recess _less/a.less:_source/css/a.css" unless File.exist?("_source/css/a.css")
  jekyllPid = Process.spawn("jekyll")
  recessPid = Process.spawn("recess _less/a.less:_source/css/a.css --watch")

  trap("INT") {
    [jekyllPid, recessPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid, recessPid].each { |pid| Process.wait(pid) }

end

# Default task, build static HTML pages and upload to my server with rsync
desc 'Build and deploy'
task :default do
  system "jekyll --no-server --no-auto --no-future --file #{assets}"
  Rake::Task["minify"].invoke
  system "rsync -avz --delete #{exclude_files} _site/ #{ssh_user}:#{remote_root}"
  puts "Deploying to server ... done"
end

# Sync static files to Amazon S3
desc 'Sync static files to S3'
task :s3 do
  sh "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' ~/dropbox/sparanoid-web/static.sparanoid.com/ s3://sparanoid/"
  puts "Syncing static files to Amazon S3 ... done"
end

# Minify HTML ouput for better performance
desc 'Minified HTML'
task :minify do
  system "java -jar _build/htmlcompressor.jar -r --type html --remove-intertag-spaces --remove-quotes --remove-http-protocol --remove-https-protocol --compress-js --compress-css -o _site _site"
  system "java -jar _build/htmlcompressor.jar -r --type xml -o _site _site"
  # CSS minification workaround. YUI Compressor has a bug dealing with SVG data URI, don't use
  # More info: http://yuilibrary.com/projects/yuicompressor/ticket/2528159
  # sh "java -jar _build/yuicompressor.jar --type css _site/css/a.css -o _site/css/a.css"
  system "perl -i -p -e 's/\n//' ./_site/css/a.css"
  puts "Minifying HTML ... done"
end