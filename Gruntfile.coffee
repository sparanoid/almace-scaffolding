"use strict"
module.exports = (grunt) ->

  # Load all grunt tasks
  matchdep = require("matchdep")
  matchdep.filterDev("grunt-*").forEach grunt.loadNpmTasks

  # Configurable paths
  coreConfig =
    cfg: grunt.file.readYAML("_config.yml")
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

    recess:
      options:
        noUniversalSelectors: false

      test:
        src: ["<%= core.app %>/assets/less/app.less"]

    watch:
      coffee:
        files: ["<%= coffeelint.test.src %>"]
        tasks: ["coffeelint"]

      less:
        files: ["<%= recess.test.src %>"]
        tasks: ["less:server", "autoprefixer", "recess"]

    less:
      server:
        options:
          dumpLineNumbers: "all"

        src: ["<%= recess.test.src %>"]
        dest: "<%= core.app %>/assets/css/app.css"

      dist:
        src: ["<%= recess.test.src %>"]
        dest: "<%= less.server.dest %>"

    autoprefixer:
      dist:
        files:
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
        command: "jekyll build -d <%= core.cfg.destination %><%= core.cfg.base %>/"

      sync:
        command: "rsync -avz --delete --progress <%= core.cfg.ignore_files %> <%= core.dist %>/ <%= core.cfg.remote_host %>:<%= core.cfg.remote_dir %> > rsync.log"

      s3:
        command: "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' <%= core.cfg.static_files %> <%= core.cfg.s3_bucket %>"

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
      "coffeelint"
    , "recess"
  ]

  # Build site with `jekyll`
  grunt.registerTask "build", [
      "clean"
    , "test"
    , "useminPrepare"
    , "less:dist"
    , "autoprefixer"
    , "shell:dist"
    , "rev"
    , "usemin"
    , "concurrent:dist"
  ]

  # Archive old version with specific URL prefix, all old versions goes to http://sparanoid.com/lab/version/
  grunt.registerTask "archive", [
      "clean"
    , "test"
    , "less:dist"
    , "autoprefixer"
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
