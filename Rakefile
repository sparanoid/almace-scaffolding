# General settings
ssh_user      = 'root@sparanoid.com' # SSH user used by rsync
remote_root   = '/srv/www/sparanoid.com/public_html' # Remote root directory
exclude_files = '--exclude=lab' # Excluded files and directories on server from being deleted (rsync --delete)
static_files  = '~/Dropbox/Sites/static.sparanoid.com/' # Staic media assets, sync'ed using s3cmd
assets_dev    = 'http://sparanoid.s3-website-us-east-1.amazonaws.com' # Media assets hosted on S3
assets        = 'http://d349cztnlupsuf.cloudfront.net' # Media assets powered by CloudFront, used for production site
# assets        = 'http://rsrc.sparanoid.com'

# Default task, build static HTML pages and upload to my server with rsync
# Set availability to 'free': `rake` or `rake default[free]`
# Set availability to 'busy': `rake default[busy]`
desc 'Build and deploy'
task :default, :availability do |t, args|
  args.with_defaults(:availability => 'free')
  availability = args.availability
  edit_config("file", "#{assets}")
  edit_config("availability", "#{availability}")
  puts "Building static files..."
  system "jekyll build"
  Rake::Task["minify"].invoke
  puts "Deploying to server..."
  system "rsync -avz --delete #{exclude_files} _site/ #{ssh_user}:#{remote_root} > rsync.log"
  # Resetting configurations
  edit_config("file", "#{assets_dev}")
  edit_config("availability", "free")
  puts "Deployed"
end

# Sync static files to Amazon S3
desc 'Sync static files to S3'
task :s3 do
  puts "Syncing static files to Amazon S3..."
  sh "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' #{static_files} s3://sparanoid/"
end

# Minify HTML ouput for better performance
desc 'Minified HTML'
task :minify do
  puts "Minifying HTML..."
  system "java -jar _build/htmlcompressor.jar -r --type html --remove-intertag-spaces --remove-quotes --remove-http-protocol --remove-https-protocol --compress-js --compress-css -o _site _site"
  system "java -jar _build/htmlcompressor.jar -r --type xml -o _site _site"
  # CSS minification workaround. YUI Compressor has a bug dealing with SVG data URI, don't use
  # More info: http://yuilibrary.com/projects/yuicompressor/ticket/2528159
  # sh "java -jar _build/yuicompressor.jar --type css _site/css/a.css -o _site/css/a.css"
  system "perl -i -p -e 's/\n//' ./_site/css/a.css"
end

def edit_config(option_name, value)
  config = File.read("_config.yml")
  regexp = Regexp.new('(^\s*' + option_name + '\s*:\s*)(\S+)(\s*)$')
  config.sub!(regexp,'\1'+value+'\3')
  File.open("_config.yml", 'w') {|f| f.write(config)}
end