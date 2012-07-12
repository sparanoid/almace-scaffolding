# 
# File compressor plugin for jekyll
# =================================
# 
# By [mytharcher](https://github.com/mytharcher)
# 2012-15-20
# 
# This plugin for compressing text files, including
# HTML and JavaScript of jekyll site. NOT support CSS
# file yet.
# 
# The JavaScript compressing requires 'packr', a
# third-party lib. I'm not sure if GitHub has this
# extension. But the compressor for HTML files works OK.
# 
# For HTML files I use a simpliest compress strategy,
# just remove all the blank between ">" and "<". So if
# your HTML text content contains "<" or ">", It would
# be danger to use this plugin.
# 

module Jekyll

  module Compressor

    def compress_html(content)
      content.gsub(/>\s+</, '><')
    end

    # Really writing process
    def output_file(dest, content)
      FileUtils.mkdir_p(File.dirname(dest))
      File.open(dest, 'w') do |f|
        f.write(content)
      end
    end

    def output_html(dest, content)
      path = self.destination(dest)
      self.output_file(path, compress_html(content))
    end

    def output_js(dest, content)
      self.output_file(dest, Packr.pack(content,
        :shrink_vars => true
      ))
    end

  end



  # Overwrite old methods to insert a hook

  class Post

    include Compressor

    def write(dest)
      self.output_html(dest, self.output)
    end

  end



  class Page

    include Compressor

    def write(dest)
      self.output_html(dest, self.output)
    end

  end

end