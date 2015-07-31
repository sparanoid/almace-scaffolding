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
      base: "<%= config.cfg.base %>"
      banner: do ->
        banner = "<!--\n"
        banner += " © <%= config.pkg.author %>.\n"
        banner += " <%= config.pkg.name %> - v<%= config.pkg.version %>\n"
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

    lesslint:
      options:
        csslint:
          csslintrc: "<%= config.app %>/assets/_less/.csslintrc"

      test:
        src: ["<%= config.app %>/assets/_less/**/app*.less"]

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
      options:
        spawn: false

      coffee:
        files: ["<%= coffeelint.gruntfile.src %>"]
        tasks: ["coffeelint:gruntfile"]

      js:
        files: ["<%= config.app %>/assets/_js/**/*.js"]
        tasks: ["copy:serve"]
        options:
          interrupt: true

      less:
        files: ["<%= config.app %>/assets/_less/**/*.less"]
        tasks: [
          "less:serve"
          "autoprefixer:serve"
        ]
        options:
          interrupt: true

      jekyll:
        files: ["<%= config.app %>/**/*"]
        tasks: ['jekyll:serve']

    uglify:
      # Deprecated, pending delete
      # Date: Apr 2, 2015, 10:56 AM
      serve:
        options:
          sourceMap: true
          sourceMapIncludeSources: true

        files: [
          expand: true
          cwd: "<%= config.app %>/assets/_js/"
          src: ["**/*.js", "!*.min.js"]
          dest: "<%= config.app %>/assets/js/"
        ]

      dist:
        options:
          report: "gzip"
          compress:
            drop_console: true

        files: [
          expand: true
          cwd: "<%= config.app %>/assets/_js/"
          src: ["**/*.js", "!*.min.js"]
          dest: "<%= config.app %>/assets/js/"
        ]

    less:
      serve:
        options:
          strictMath: true
          sourceMap: true
          outputSourceFiles: true

        files: [
          expand: true
          cwd: "<%= config.app %>/assets/_less/"
          src: ["**/app*.less"]
          dest: "<%= config.app %>/assets/css/"
          ext: ".css"
        ]

      dist:
        files: "<%= less.serve.files %>"

    autoprefixer:
      serve:
        src: "<%= config.app %>/assets/css/**/*.css"
        options:
          map: true

      dist:
        src: "<%= autoprefixer.serve.src %>"

    csscomb:
      options:
        config: "<%= config.app %>/assets/_less/.csscomb.json"

      dist:
        files: [
          expand: true
          cwd: "<%= less.serve.files.0.dest %>"
          src: ["*.css"]
          dest: "<%= less.serve.files.0.dest %>"
          ext: ".css"
        ]

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
          cwd: "<%= config.dist %>"
          src: ["**/*.css", "!*.min.css"]
          dest: "<%= config.dist %>/"
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
        includeTag: "[data-inline]"
        assetsUrlPrefix: "<%= config.base %>/assets/"

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

    jekyll:
      options:
        bundleExec: true

      serve:
        options:
          config: "_config.yml,_config.dev.yml"
          drafts: true
          future: true

      dist:
        options:
          config: "_config.yml"
          dest: "<%= config.dist %><%= config.base %>"

    shell:
      options:
        stdout: true

      # Direct sync compiled static files to remote server
      syncServer:
        command: "rsync -avz --delete --progress <%= config.cfg.ignore_files %> <%= config.dist %>/ <%= config.cfg.remote_host %>:<%= config.cfg.remote_dir %> > rsync.log"

      # Copy compiled static files to local directory for further post-process
      syncLocal:
        command: "rsync -avz --delete --progress <%= config.cfg.ignore_files %> <%= jekyll.dist.options.dest %>/ /Users/sparanoid/Workspace/Sites/sparanoid.com<%= config.base %> > rsync.log"

      # Sync images to a separate CloudFront
      s3:
        command: "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --add-header=Cache-Control:max-age=31536000 --exclude '.DS_Store' <%= config.cfg.static_files %> <%= config.cfg.s3_bucket %>"

    concurrent:
      options:
        logConcurrentOutput: true

      dist:
        tasks: [
          "htmlmin"
          "xmlmin"
          "cssmin"
        ]

    copy:
      serve:
        files: [
          expand: true
          dot: true
          cwd: "<%= config.app %>/assets/_js/"
          src: ["**/*.js"]
          dest: "<%= config.app %>/assets/js/"
        ]

    clean:
      default:
        src: [
          ".tmp"
          "<%= config.app %>/assets/css/"
          "<%= config.app %>/assets/js/"
        ]

      jekyllMetadata:
        src: [
          "<%= config.dist %>"
          "<%= config.app %>/.jekyll-metadata"
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

    browserSync:
      bsFiles:
        src: ["<%= config.dist %>/**"]
      options:
        watchTask: true
        server:
          baseDir: "<%= config.dist %>"
        port: "<%= config.cfg.port %>"
        ghostMode:
          clicks: true
          scroll: true
          location: true
          forms: true
        logFileChanges: false
        snippetOptions:
          rule:
            match: /<!-- BS_INSERT -->/i
            fn: (snippet, match) ->
              match + snippet
        # Uncomment the following options for client presentation
        # tunnel: "<%= config.pkg.name %>"
        # online: true
        open: true
        browser: [
          "safari"
          "google chrome"
          "firefox"
        ]
        notify: true

    release:
      options:
        changelog: false,
        file: "package.json"
        npm: false
        commitMessage: "chore: release <%= version %>"
        tagName: "v<%= version %>"
        tagMessage: "chore: tagging version <%= version %>"
        afterBump: [
          "changelog"
        ]
        # Dev options
        commit: false
        tag: false
        push: false
        pushTags: false

  grunt.registerTask "reset", "Reset user availability", (target) ->
    grunt.config.set "replace.availability.replacements.0.to", "$1 true"
    grunt.task.run [
      "replace"
    ]

  grunt.registerTask "serve", "Fire up a server on local machine for development", [
    "clean"
    "copy:serve"
    "less:serve"
    "autoprefixer:serve"
    "jekyll:serve"
    "browserSync"
    "watch"
  ]

  grunt.registerTask "test", "Build test task", [
    "build"
    "lesslint"
    "validation"
  ]

  grunt.registerTask "build", "Build site with `jekyll`, use `--busy` to set availability to false", (target) ->
    grunt.config.set "replace.availability.replacements.0.to", "$1 false" if grunt.option("busy")
    if grunt.option("fast")
      grunt.task.run [
        "replace"
        "clean"
        "coffeelint"
        "uglify:dist"
        "less:dist"
        "autoprefixer:dist"
        "csscomb"
        "jekyll:dist"
        "usebanner"
        "reset"
      ]
    else
      grunt.task.run [
        "replace"
        "clean"
        "coffeelint"
        "uglify:dist"
        "less:dist"
        "autoprefixer:dist"
        "csscomb"
        "jekyll:dist"
        "concurrent:dist"
        "smoosher"
        "usebanner"
        "reset"
      ]

  grunt.registerTask "sync", "Build site + rsync static files to remote server", [
    "build"
    "shell:syncLocal"
  ]

  grunt.registerTask "s3", "Sync image assets with `s3cmd`", [
    "shell:s3"
  ]

  grunt.registerTask "default", "Default task aka. build task", [
    "build"
  ]
