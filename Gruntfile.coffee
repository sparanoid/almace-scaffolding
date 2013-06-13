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
    assets: "<%= core.cfg.source %>/css"
    dist: "<%= core.cfg.destination %>"
    banner: do ->
      banner = "/*!\n"
      banner += " * (c) <%= core.pkg.author %>.\n *\n"
      banner += " * <%= core.pkg.name %> - v<%= core.pkg.version %> (<%= grunt.template.today('mm-dd-yyyy') %>)\n"
      # banner += " * <%= core.pkg.homepage %>\n"
      banner += " * <%= core.pkg.license.type %> - <%= core.pkg.license.url %>\n"
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
        files:
          src: ["Gruntfile.coffee"]

    recess:
      test:
        files:
          src: ["<%= core.app %>/css/a.less"]

    watch:
      coffee:
        files: ["<%= coffeelint.test.files.src %>"]
        tasks: ["coffeelint"]

      less:
        files: ["<%= recess.test.files.src %>"]
        tasks: ["less:server", "recess"]

    less:
      server:
        options:
          paths: ["<%= core.assets %>"]
          dumpLineNumbers: "all"

        files:
          "<%= core.app %>/css/a.css": ["<%= core.app %>/css/a.less"]

      dist:
        options:
          paths: ["<%= core.assets %>"]

        files:
          "<%= core.app %>/css/a.css": ["<%= core.app %>/css/a.less"]

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

        files:
          "<%= core.dist %>/css/a.css": ["<%= core.dist %>/css/*.css"]

    shell:
      options:
        stdout: true

      server:
        command: "jekyll serve --watch"

      dist:
        command: "jekyll build"

      archive:
        command: "jekyll build --baseurl <%= core.cfg.base %>/ -d <%= core.cfg.destination %><%= core.cfg.base %>/"

      sync:
        command: "rsync -avz --delete <%= core.cfg.ignore_files %> <%= core.dist %>/ <%= core.cfg.remote_user %>:<%= core.cfg.remote_dir %> > rsync.log"

      s3:
        command: "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' <%= core.cfg.static_files %> <%= core.cfg.s3_bucket %>"

      log:
        command: "git log <%= core.pkg.version %>..HEAD --reverse --format=%B | sed '/^$/d' | sed 's/^/- /'"

    concurrent:
      server:
        tasks: ["shell:server", "watch"]

      dist:
        tasks: ["htmlmin", "xmlmin", "cssmin"]


    clean: [".tmp", "<%= core.dist %>/*"]

  grunt.registerTask "server", ["less:server", "concurrent"]
  grunt.registerTask "test", ["coffeelint", "recess"]
  grunt.registerTask "build", ["clean", "test", "less:dist", "shell:dist", "concurrent:dist"]
  grunt.registerTask "archive", ["build", "shell:archive", "concurrent:dist"]
  grunt.registerTask "sync", ["build", "shell:sync"]
  grunt.registerTask "s3", ["shell:s3"]
  grunt.registerTask "log", ["shell:log"]
  grunt.registerTask "default", ["build"]
