dox = require "dox"

module.exports = (grunt)->

  #grunt.loadNpmTasks "grunt-extend-config"

  grunt.extendConfig {
    "bdocs":
      sources:
        expand: true
        cwd: 'src/'
        src: '**/*.coffee'
        dest: 'docs/_data/'
        ext: ".json"
  }

  grunt.registerMultiTask "bdocs", "Get comments from src/*. to docs/_data/*.json", ->
    @files.forEach (file) ->
      filePath = file.src[0]
      coffee = grunt.file.read filePath

      prettyJSON = JSON.stringify dox.parseCommentsCoffee(coffee), undefined, 2

      grunt.file.write file.dest, prettyJSON
