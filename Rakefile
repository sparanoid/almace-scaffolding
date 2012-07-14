# Settings
ssh_user = 'root@sparanoid.com'
remote_root = '/srv/www/sparanoid.com/public_html'
exclude_files = '--include=*.min.css --exclude=*.ai --exclude=*.psd --exclude=lab --exclude=*.less'

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
  sh "java -jar _build/htmlcompressor-1.5.3.jar -r --remove-intertag-spaces --remove-quotes --remove-http-protocol --remove-https-protocol --compress-js --compress-css --type html -o _site _site"
  puts '>>> Minified.'
end

desc 'Ping PubSubHubbub server'
task :ping => [:default, :s3] do
  # Settings
  pubsubhubbub_server = 'http://sparanoid.superfeedr.com'
  feed_url = 'http://sparanoid.com/feed/'

  # Deploy
  puts '>>> Ping PubSubHubbub server...'
  # system("curl -X POST #{pubsubhubbub_server} -d\"hub.mode=publish\" -d\"hub.url=#{feed_url}\" -D-")
  sh "curl -X POST http://sparanoid.superfeedr.com -d\"hub.mode=publish\" -d\"hub.url=http://sparanoid.com/feed/\" -D-"
  puts "Ping success"
end

desc 'Ping pubsubhubbub server'
task :ping_alt => [:default, :s3] do
  require 'cgi'
  require 'net/http'
  data = 'hub.mode=publish&hub.url=' + CGI::escape("http://sparanoid.com/feed/")
  http = Net::HTTP.new('pubsubhubbub.appspot.com', 80)
  resp, data = http.post('http://pubsubhubbub.appspot.com/publish',
                         data,
                         {'Content-Type' => 'application/x-www-form-urlencoded'})

  puts "Ping error: #{resp}, #{data}" unless resp.code == "204"
  puts "Ping success: #{resp}, #{data}" unless resp.code != "204"
end