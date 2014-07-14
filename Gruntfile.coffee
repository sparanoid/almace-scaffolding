"use strict"
module.exports = (grunt) ->

  # Load all grunt tasks
  require("matchdep").filterDev("grunt-*").forEach grunt.loadNpmTasks

  # Track tasks load time
  require("time-grunt") grunt

  # Project configurations
  grunt.initConfig
    config:
      cfg: grunt.file.readYAML("_config.yml")
      pkg: grunt.file.readJSON("package.json")
      app: "<%= config.cfg.source %>"
      dist: "<%= config.cfg.destination %>"
      banner: do ->
        banner = "<!--\n"
        banner += " © <%= config.pkg.author %>.\n\n"
        banner += " <%= config.pkg.name %> - v<%= config.pkg.version %> (<%= grunt.template.today('mm-dd-yyyy') %>)\n"
        # banner += " <%= config.pkg.homepage %>\n"
        banner += " <%= config.pkg.licenses.type %> - <%= config.pkg.licenses.url %>\n"
        banner += " -->"
        banner

    coffeelint:
      options:
        indentation: 2
        no_stand_alone_at:
          level: "error"
        no_empty_param_list:
          level: "error"
        max_line_length:
          level: "ignore"

      gruntfile:
        src: ["Gruntfile.coffee"]

    csslint:
      options:
        csslintrc: "<%= config.app %>/assets/_less/.csslintrc"

      test:
        src: ["<%= config.app %>/assets/css/app.css"]

    validation:
      options:
        reset: true
        charset: "utf-8"
        doctype: "HTML5"
        relaxerror: [
          "Bad value X-UA-Compatible for attribute http-equiv on element meta."
          "An img element must have an alt attribute, except under certain conditions. For details, consult guidance on providing text alternatives for images."
        ]
      dist:
        src: ["<%= config.dist %>/**/*.html"]

    watch:
      coffee:
        files: ["<%= coffeelint.gruntfile.src %>"]
        tasks: ["coffeelint:gruntfile"]

      js:
        files: ["<%= config.app %>/assets/_js/**/*.js"]
        tasks: [
          "uglify:server"
        ]

      less:
        files: ["<%= config.app %>/assets/_less/**/*.less"]
        tasks: [
          "less:server"
          "autoprefixer"
          # "csslint"
        ]

    uglify:
      server:
        options:
          sourceMap: true

        files: [
          expand: true
          cwd: "<%= config.app %>/assets/_js/"
          src: ["*.js", "!*.min.js"]
          dest: "<%= config.app %>/assets/js/"
        ]

      dist:
        options:
          report: "gzip"

        files: [
          expand: true
          cwd: "<%= config.app %>/assets/_js/"
          src: ["*.js", "!*.min.js"]
          dest: "<%= config.app %>/assets/js/"
        ]

    less:
      server:
        options:
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: "app.css.map"
          sourceMapFilename: "<%= config.app %>/assets/css/app.css.map"

        src: ["<%= config.app %>/assets/_less/app.less"]
        dest: "<%= config.app %>/assets/css/app.css"

      dist:
        src: ["<%= less.server.src %>"]
        dest: "<%= less.server.dest %>"

    autoprefixer:
      dist:
        src: ["<%= less.server.dest %>"]
        dest: "<%= less.server.dest %>"

    csscomb:
      options:
        config: "<%= config.app %>/assets/_less/.csscomb.json"

      dist:
        src: ["<%= less.server.dest %>"]
        dest: "<%= less.server.dest %>"

    htmlmin:
      dist:
        options:
          removeComments: true
          removeCommentsFromCDATA: true
          removeCDATASectionsFromCDATA: true
          collapseWhitespace: true
          conservativeCollapse: true
          collapseBooleanAttributes: true
          removeAttributeQuotes: false
          removeRedundantAttributes: true
          useShortDoctype: false
          removeEmptyAttributes: true
          removeOptionalTags: true
          removeEmptyElements: false
          lint: false
          keepClosingSlash: true
          caseSensitive: true
          minifyJS: true
          minifyCSS: true

        files: [
          expand: true
          cwd: "<%= config.dist %>"
          src: "**/*.html"
          dest: "<%= config.dist %>/"
        ]

    xmlmin:
      dist:
        files: [
          expand: true
          cwd: "<%= config.dist %>"
          src: "**/*.xml"
          dest: "<%= config.dist %>/"
        ]

    cssmin:
      dist:
        options:
          report: "gzip"

        files: [
          expand: true
          cwd: "<%= config.dist %>/assets/css/"
          src: ["*.css", "!*.min.css"]
          dest: "<%= config.dist %>/assets/css/"
        ]

      # html:
      #   expand: true
      #   cwd: "<%= config.dist %>"
      #   src: "**/*.html"
      #   dest: "<%= config.dist %>"

    smoosher:
      options:
        jsDir: "<%= config.dist %>"
        cssDir: "<%= config.dist %>"

      dist:
        files: [
          expand: true
          cwd: "<%= config.dist %>"
          src: "**/*.html"
          dest: "<%= config.dist %>/"
        ]

    usebanner:
      options:
        position: "bottom"
        banner: "<%= config.banner %>"

      dist:
        files:
          src: ["<%= config.dist %>/**/*.html"]

    shell:
      options:
        stdout: true

      server:
        command: "jekyll serve --watch --future --drafts --config _config.yml,_config.dev.yml"

      dist:
        command: "jekyll build"

      sync:
        command: "rsync -avz --delete --progress <%= config.cfg.ignore_files %> <%= config.dist %>/ <%= config.cfg.remote_host %>:<%= config.cfg.remote_dir %> > rsync.log"

      s3:
        command: "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' <%= config.cfg.static_files %> <%= config.cfg.s3_bucket %>"

    concurrent:
      options:
        logConcurrentOutput: true

      server:
        tasks: [
          "shell:server"
          "watch"
        ]

      dist:
        tasks: [
          "htmlmin"
          "xmlmin"
          "cssmin"
        ]

    clean:
      dist:
        src: [
          ".tmp"
        ]

      postDist:
        src: [
          "<%= config.dist %>/assets/css/"
          "<%= config.dist %>/assets/js/"
        ]

    cleanempty:
      dist:
        src: ["<%= config.dist %>/**/*"]

    replace:
      availability:
        src: ["<%= config.app %>/_data/availability.yml"]
        dest: "<%= config.app %>/_data/availability.yml"
        replacements: [
          {
            from: /(free:)(.+)/g
            to: "$1 true"
          }
        ]

  grunt.registerTask "reset", "Reset user availability", (target) ->
    grunt.config.set "replace.availability.replacements.0.to", "$1 true"
    grunt.task.run [
      "replace"
    ]

  grunt.registerTask "serve", "Fire up a server on local machine for development", [
    "clean"
    "uglify:server"
    "less:server"
    "autoprefixer"
    "concurrent:server"
  ]

  grunt.registerTask "test", "Build test task", [
    "build"
    # "csslint"
    "validation"
  ]

  grunt.registerTask "build", "Build site with `jekyll`, use `--busy` to set availability to false", (target) ->
    grunt.config.set "replace.availability.replacements.0.to", "$1 false" if grunt.option("busy")
    grunt.task.run [
      "replace"
      "clean"
      "coffeelint"
      "uglify:dist"
      "less:dist"
      "autoprefixer"
      "csscomb"
      "shell:dist"
      "concurrent:dist"
      "smoosher"
      "usebanner"
      "clean:postDist"
      "reset"
    ]

  grunt.registerTask "sync", "Build site + rsync static files to remote server", [
    "build"
    "shell:sync"
  ]

  grunt.registerTask "s3", "Sync image assets with `s3cmd`", [
    "shell:s3"
  ]

  grunt.registerTask "default", "Default task aka. build task", [
    "build"
  ]
