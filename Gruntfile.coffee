"use strict"
module.exports = (grunt) ->

  # Load all grunt tasks
  matchdep = require("matchdep")
  matchdep.filterDev("grunt-*").forEach grunt.loadNpmTasks

  # Configurable paths
  coreConfig =
    cfg: grunt.file.readYAML("_config.yml")
    var: grunt.file.readYAML("./_app/_data/var.yml")
    pkg: grunt.file.readJSON("package.json")
    app: "<%= core.cfg.source %>"
    dist: "<%= core.cfg.destination %>"
    banner: do ->
      banner = "/*!\n"
      banner += " * (c) <%= core.pkg.author %>.\n *\n"
      banner += " * <%= core.pkg.name %> - v<%= core.pkg.version %> (<%= grunt.template.today('mm-dd-yyyy') %>)\n"
      # banner += " * <%= core.pkg.homepage %>\n"
      banner += " * <%= core.pkg.licenses.type %> - <%= core.pkg.licenses.url %>\n"
      banner += " */"
      banner

  # Project configurations
  grunt.initConfig
    core: coreConfig

    coffeelint:
      options:
        indentation: 2
        no_stand_alone_at:
          level: "error"
        no_empty_param_list:
          level: "error"
        max_line_length:
          level: "ignore"

      test:
        src: ["Gruntfile.coffee"]

    csslint:
      options:
        csslintrc: "<%= core.app %>/assets/less/.csslintrc"

      test:
        src: ["<%= core.app %>/assets/css/app.css"]

    validation:
      options:
        reset: true
        charset: "utf-8"
        doctype: "HTML5"
        failHard: true
        relaxerror: [
          "Bad value X-UA-Compatible for attribute http-equiv on element meta."
          "An img element must have an alt attribute, except under certain conditions. For details, consult guidance on providing text alternatives for images."
        ]
      dist:
        src: ["<%= core.dist %>/**/*.html"]

    watch:
      coffee:
        files: ["<%= coffeelint.test.src %>"]
        tasks: ["coffeelint"]

      less:
        files: ["<%= core.app %>/assets/less/**/*.less"]
        tasks: ["less:server", "autoprefixer", "csslint"]

    less:
      server:
        options:
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          sourceMapURL: "app.css.map"
          sourceMapFilename: "<%= core.app %>/assets/css/app.css.map"

        src: ["<%= core.app %>/assets/less/app.less"]
        dest: "<%= core.app %>/assets/css/app.css"

      dist:
        src: ["<%= less.server.src %>"]
        dest: "<%= less.server.dest %>"

    autoprefixer:
      dist:
        src: ["<%= less.server.dest %>"]
        dest: "<%= less.server.dest %>"

    csscomb:
      options:
        config: "<%= core.app %>/assets/less/.csscomb.json"

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
          collapseBooleanAttributes: true
          removeAttributeQuotes: true
          removeRedundantAttributes: true
          useShortDoctype: false
          removeEmptyAttributes: true
          removeOptionalTags: false
          removeEmptyElements: false

        files: [
          expand: true
          cwd: "<%= core.dist %>"
          src: "**/*.html"
          dest: "<%= core.dist %>/"
        ]

    xmlmin:
      dist:
        files: [
          expand: true
          cwd: "<%= core.dist %>"
          src: "**/*.xml"
          dest: "<%= core.dist %>/"
        ]

    cssmin:
      dist:
        options:
          banner: "<%= core.banner %>"
          report: "gzip"

        files: [
          expand: true
          cwd: "<%= core.dist %>/assets/css/"
          src: ["*.css", "!*.min.css"]
          dest: "<%= core.dist %>/assets/css/"
        ]

      # html:
      #   expand: true
      #   cwd: "<%= core.dist %>"
      #   src: "**/*.html"
      #   dest: "<%= core.dist %>"

    rev:
      options:
        encoding: "utf8"
        algorithm: "md5"
        length: 6

      files:
        src: ["<%= core.dist %>/assets/**/*.{js,css,png,jpg,gif,woff}"]

    useminPrepare:
      html: "<%= core.dist %>/index.html"

    usemin:
      options:
        assetsDirs: ["<%= core.dist %>"]

      html: ["<%= core.dist %>/**/*.html"]
      css: ["<%= core.dist %>/assets/css/*.css"]

    shell:
      options:
        stdout: true

      server:
        command: "jekyll serve --watch --future"

      dist:
        command: "jekyll build"

      archive:
        command: "jekyll build -d <%= core.cfg.destination %><%= core.var.base %>/"

      sync:
        command: "rsync -avz --delete --progress <%= core.var.ignore_files %> <%= core.dist %>/ <%= core.var.remote_host %>:<%= core.var.remote_dir %> > rsync.log"

      s3:
        command: "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' <%= core.var.static_files %> <%= core.var.s3_bucket %>"

      log:
        command: "git log v<%= core.pkg.version %>..HEAD --reverse --format=%B | sed '/^$/d' | sed 's/^/- /'"

    concurrent:
      options:
        logConcurrentOutput: true

      server:
        tasks: ["shell:server", "watch"]

      dist:
        tasks: ["htmlmin", "xmlmin", "cssmin"]

    clean: [".tmp", "<%= core.dist %>/*"]

  # Fire up a server on local machine for development
  grunt.registerTask "server", [
      "clean"
    , "concurrent:server"
  ]

  # Test task
  grunt.registerTask "test", [
      "build"
    , "csslint"
    , "validation"
  ]

  # Build site with `jekyll`
  grunt.registerTask "build", [
      "clean"
    , "coffeelint"
    , "useminPrepare"
    , "less:dist"
    , "autoprefixer"
    , "csscomb"
    , "shell:dist"
    , "rev"
    , "usemin"
    , "concurrent:dist"
  ]

  # Archive old version with specific URL prefix, all old versions goes to http://sparanoid.com/lab/version/
  grunt.registerTask "archive", [
      "clean"
    , "less:dist"
    , "autoprefixer"
    , "csscomb"
    , "shell:archive"
    , "concurrent:dist"
  ]

  # Build site + rsync static files to remote server
  grunt.registerTask "sync", [
      "build"
    , "shell:sync"
  ]

  # Sync image assets with `s3cmd`
  grunt.registerTask "s3", ["shell:s3"]

  # Dump git log
  grunt.registerTask "log", ["shell:log"]

  # Default task aka. build task
  grunt.registerTask "default", ["build"]
