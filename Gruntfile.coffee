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
      amsf_cfg: grunt.file.readYAML("_amsf/_config.yml")
      amsf_base: "_amsf"
      amsf_core: "<%= config.amsf_base %>/core"
      amsf_theme: "<%= config.amsf_cfg.theme %>"
      amsf_theme_new: grunt.option('theme') or "<%= config.amsf_theme %>"
      amsf_theme_new_author: grunt.option('user') or "amsf"
      app: "<%= config.cfg.source %>"
      dist: "<%= config.cfg.destination %>"
      base: "<%= config.cfg.base %>"
      assets: "<%= config.app %>/assets/themes/<%= config.amsf_theme %>"
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
          csslintrc: "<%= config.assets %>/_less/.csslintrc"

      test:
        src: ["<%= config.assets %>/_less/**/app*.less"]

    watch:
      options:
        spawn: false

      coffee:
        files: ["<%= coffeelint.gruntfile.src %>"]
        tasks: ["coffeelint:gruntfile"]

      js:
        files: ["<%= config.assets %>/_js/**/*.js"]
        tasks: ["copy:serve"]
        options:
          interrupt: true

      less:
        files: ["<%= config.assets %>/_less/**/*.less"]
        tasks: [
          "less:serve"
          "postcss:serve"
        ]
        options:
          interrupt: true

      jekyll:
        files: ["<%= config.app %>/**/*", "!_*"]
        tasks: ['jekyll:serve']

    uglify:
      dist:
        options:
          report: "gzip"
          compress:
            drop_console: true

        files: [
          expand: true
          cwd: "<%= config.assets %>/_js/"
          src: ["**/*.js", "!*.min.js"]
          dest: "<%= config.assets %>/js/"
        ]

    less:
      serve:
        options:
          strictMath: true
          sourceMap: true
          outputSourceFiles: true
          dumpLineNumbers: "comments"

        files: [
          expand: true
          cwd: "<%= config.assets %>/_less/"
          src: ["**/app*.less"]
          dest: "<%= config.assets %>/css/"
          ext: ".css"
        ]

      dist:
        files: "<%= less.serve.files %>"

    postcss:
      serve:
        src: "<%= config.assets %>/css/*.css"
        options:
          map:
            inline: false
          processors: [
            require("autoprefixer-core")(browsers: "last 1 versions")
          ]

      dist:
        src: "<%= postcss.serve.src %>"
        options:
          processors: [
            require("autoprefixer-core")(browsers: "last 2 versions")
          ]

    csscomb:
      options:
        config: "<%= config.assets %>/_less/.csscomb.json"

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

    assets_inline:
      options:
        jsDir: "<%= config.dist %>"
        cssDir: "<%= config.dist %>"
        assetsDir: "<%= config.dist %>"
        includeTag: "?assets-inline"
        inlineImg: false
        inlineSvg: true
        inlineSvgBase64: false
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
          config: "_config.yml,_amsf/_config.yml,<%= config.app %>/_data/<%= config.amsf_theme %>.yml,_config.dev.yml"
          drafts: true
          future: true

      dist:
        options:
          config: "_config.yml,_amsf/_config.yml,<%= config.app %>/_data/<%= config.amsf_theme %>.yml"
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
          cwd: "<%= config.assets %>/_js/"
          src: ["**/*.js"]
          dest: "<%= config.assets %>/js/"
        ]

      amsf__core__to_app:
        files: [
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_core %>/"
            src: [
              ".*"
              "*.json"
              "*.md"
              "*.yml"
              "Gemfile"
              "Gruntfile*" # Comment this when debugging this task
              "LICENSE"
              "package.json"
              "!.DS_Store"
              "!TODOS.md"
            ]
            dest: "./"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_core %>/_app/"
            src: [
              "*.xml"
              "*.txt"
            ]
            dest: "<%= config.app %>/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_core %>/_app/_includes/"
            src: [
              "_amsf.html"
            ]
            dest: "<%= config.app %>/_includes/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_core %>/_app/_layouts/"
            src: ["**"]
            dest: "<%= config.app %>/_layouts/"
          }
        ]

      amsf__theme__to_app:
        files: [
          {
            src: ["<%= config.amsf_base %>/themes/<%= config.amsf_theme_new %>/config.yml"]
            dest: "<%= config.app %>/_data/<%= config.amsf_theme_new %>.yml"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_base %>/themes/<%= config.amsf_theme_new %>/includes/"
            src: ["**"]
            dest: "<%= config.app %>/_includes/themes/<%= config.amsf_theme_new %>/includes/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_base %>/themes/<%= config.amsf_theme_new %>/layouts/"
            src: ["**"]
            dest: "<%= config.app %>/_includes/themes/<%= config.amsf_theme_new %>/layouts/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_base %>/themes/<%= config.amsf_theme_new %>/assets/"
            src: ["**"]
            dest: "<%= config.app %>/assets/themes/<%= config.amsf_theme_new %>/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.amsf_base %>/themes/<%= config.amsf_theme_new %>/pages/"
            src: ["**"]
            dest: "<%= config.app %>/_pages/themes/<%= config.amsf_theme_new %>/"
          }
        ]

      amsf__theme__to_cache:
        files: [
          {
            src: ["<%= config.app %>/_data/<%= config.amsf_theme %>.yml"]
            dest: "<%= config.amsf_base %>/themes/<%= config.amsf_theme %>/config.yml"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.app %>/_includes/themes/<%= config.amsf_theme %>/includes/"
            src: ["**"]
            dest: "<%= config.amsf_base %>/themes/<%= config.amsf_theme %>/includes/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.app %>/_includes/themes/<%= config.amsf_theme %>/layouts/"
            src: ["**"]
            dest: "<%= config.amsf_base %>/themes/<%= config.amsf_theme %>/layouts/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.app %>/assets/themes/<%= config.amsf_theme %>/"
            src: ["**"]
            dest: "<%= config.amsf_base %>/themes/<%= config.amsf_theme %>/assets/"
          }
          {
            expand: true
            dot: true
            cwd: "<%= config.app %>/_pages/themes/<%= config.amsf_theme %>/"
            src: ["**"]
            dest: "<%= config.amsf_base %>/themes/<%= config.amsf_theme %>/pages/"
          }
        ]


    gitclone:
      amsf__core__add_remote:
        options:
          repository: "https://github.com/sparanoid/almace-scaffolding.git"
          branch: "master"
          directory: "<%= config.amsf_base %>/core/"

      amsf__theme__add_remote:
        options:
          repository: "https://github.com/<%= config.amsf_theme_new_author %>/amsf-<%= config.amsf_theme_new %>.git"
          branch: "master"
          directory: "<%= config.amsf_base %>/themes/<%= config.amsf_theme_new %>/"

    gitpull:
      amsf__core__update_remote:
        options:
          cwd: "<%= config.amsf_base %>/core/"

      amsf__theme__update_remote:
        options:
          cwd: "<%= config.amsf_base %>/themes/<%= config.amsf_theme %>/"

    clean:
      default:
        src: [
          ".tmp"
          "<%= config.assets %>/css/"
          "<%= config.assets %>/js/"
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
      amsf__theme__update_config:
        src: ["<%= config.amsf_base %>/_config.yml"]
        dest: "<%= config.amsf_base %>/_config.yml"
        replacements: [
          {
            from: /(theme:)( +)(.+)/g
            to: "$1$2<%= config.amsf_theme_new %>"
          }
        ]

      amsf__site__update_version:
        src: ["<%= config.app %>/_pages/index.html"]
        dest: "<%= config.app %>/_pages/index.html"
        replacements: [
          {
            from: /("amsf-version">)\d+\.\d+\.\d+/g
            to: "$1<%= config.pkg.version %>"
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

    conventionalChangelog:
      options:
        changelogOpts:
          preset: "angular"

      dist:
        src: "CHANGELOG.md"

    bump:
      options:
        files: ["package.json"]
        updateConfigs: ["config.pkg"]
        commitMessage: 'chore: release v%VERSION%'
        commitFiles: ["-a"]
        tagMessage: 'chore: create tag %VERSION%'
        push: false

  grunt.registerTask "serve", "Fire up a server on local machine for development", [
    "clean"
    "copy:serve"
    "less:serve"
    "postcss:serve"
    "jekyll:serve"
    "browserSync"
    "watch"
  ]

  grunt.registerTask "test", "Build test task", [
    "build"
  ]

  grunt.registerTask "theme-upgrade", "Upgrade specific theme from AMSF cache to app", [
    "copy:amsf__theme__to_app"
  ]

  grunt.registerTask "theme-save", "Save current (previously activated) theme to AMSF cache", [
    "copy:amsf__theme__to_cache"
  ]

  grunt.registerTask "theme-activate", "Activate specific theme", [
    "theme-upgrade"
    "theme-save"
    "replace:amsf__theme__update_config"
  ]

  grunt.registerTask "theme-add", "Add new theme from a GitHub repo", [
    "gitclone:amsf__theme__add_remote"
    "theme-activate"
  ]

  grunt.registerTask "theme-update", "Update current theme from GitHub", [
    "gitpull:amsf__theme__update_remote"
    "theme-upgrade"
  ]

  grunt.registerTask "amsf-update", "Upgrade AM", [
    "gitpull:amsf__core__update_remote"
    "copy:amsf__core__to_app"
  ]

  grunt.registerTask "amsf-update", "Update ASMF", ->
    # TODO: need better implement
    if grunt.file.exists("_amsf/core/")
      grunt.task.run [
        "gitpull:amsf__core__update_remote"
        "copy:amsf__core__to_app"
      ]
    else
      grunt.task.run [
        "gitclone:amsf__core__add_remote"
        "copy:amsf__core__to_app"
      ]

  grunt.registerTask "build", "Build site with jekyll", [
    "clean"
    "coffeelint"
    "uglify"
    "lesslint"
    "less:dist"
    "postcss:dist"
    "csscomb"
    "jekyll:dist"
    "concurrent:dist"
    "assets_inline"
    "usebanner"
    "cleanempty"
  ]

  # Release new version
  grunt.registerTask "release", "Build, bump and commit", (type) ->
    grunt.task.run [
      "bump-only:#{type or 'patch'}"
      "conventionalChangelog"
      "replace:amsf__site__update_version"
      "bump-commit"
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
