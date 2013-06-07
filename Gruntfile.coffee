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
      options:
        # See: https://github.com/twitter/bootstrap/issues/6517
        strictPropertyOrder: false
        noOverqualifying: false
        noUniversalSelectors: false
        noIDs: false
        noUnderscores: false
        zeroUnits: false

      test:
        files:
          src: ["<%= core.assets %>/a.less"]

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
          "<%= core.assets %>/a.css": ["<%= core.assets %>/a.less"]

      dist:
        options:
          paths: ["<%= core.assets %>"]
          # yuicompress: true

        files:
          "<%= core.assets %>/a.css": ["<%= core.assets %>/a.less"]

    cssmin:
      dist:
        options:
          banner: "<%= core.banner %>"
          report: "gzip"

        files:
          "<%= core.assets %>/a.css": ["<%= core.assets %>/*.css"]

    shell:
      options:
        stdout: true

      server:
        command: "jekyll serve --watch"

      dist:
        command: "jekyll build"

      sync:
        command: "rsync -avz --delete <%= core.cfg.ignore_files %> <%= core.dist %>/ <%= core.cfg.remote_user %>:<%= core.cfg.remote_dir %> > rsync.log"

      s3:
        command: "s3cmd sync -rP --guess-mime-type --delete-removed --no-preserve --cf-invalidate --exclude '.DS_Store' <%= core.cfg.static_files %> <%= core.cfg.s3_bucket %>"

    concurrent:
      server:
        options:
          logConcurrentOutput: true

        tasks: ["shell:server", "watch"]

    clean: [".tmp", "<%= core.dist %>/*"]

  grunt.registerTask "server", ["less:server", "concurrent"]
  grunt.registerTask "test", ["coffeelint", "recess"]
  grunt.registerTask "build", ["clean", "test", "less:dist", "cssmin", "shell:dist"]
  grunt.registerTask "sync", ["build", "shell:sync"]
  grunt.registerTask "s3", ["shell:s3"]
  grunt.registerTask "default", ["build"]
