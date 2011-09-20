desc 'Build and deploy'
task :default do
	# Settings
	ssh_key = '/Users/sparanoid/dropbox/sparanoid-web/~ssh/sparanoid-CA.pem'
	ssh_user = 'ec2-user@sparanoid.com'
	remote_root = '/usr/share/nginx/html/'
	exclude_files = '--include=*.min.css --exclude=*.ai --exclude=*.psd --exclude=lab --exclude=speedtest --exclude=*.css'

	# Deploy
	puts 'Deploying to EC2...'
	system("jekyll --no-server --no-auto && rsync -avz --delete #{exclude_files} -e \"ssh -i #{ssh_key}\" _site/  #{ssh_user}:#{remote_root}")
	# system("jekyll --no-server --no-auto && rsync -avz --delete #{exclude_files} _site/  #{ssh_user}:#{remote_root}")
	puts 'Deployed.'
end

desc 'Ping PubSubHubbub server.'
task :default do
	# Settings
	pubsubhubbub_server = 'http://sparanoid.superfeedr.com'
	feed_url = 'http://sparanoid.com/feed/'

	# Deploy
	puts 'Ping PubSubHubbub server...'
	# system("curl -X POST #{pubsubhubbub_server} -d\"hub.mode=publish\" -d\"hub.url=#{feed_url}\" -D-")
	system("curl -X POST http://sparanoid.superfeedr.com -d\"hub.mode=publish\" -d\"hub.url=http://sparanoid.com/feed/\" -D-")
	puts "Ping success"
end

desc 'Ping pubsubhubbub server.'
task :ping do
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