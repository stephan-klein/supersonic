dox = require "dox"
_ = require "lodash"

module.exports = (grunt)->

  #grunt.loadNpmTasks "grunt-extend-config"

  grunt.extendConfig {
    "docs":
      sources:
        expand: true
        cwd: 'src/'
        src: '**/*.coffee'
        dest: 'docs/_data/'
        ext: ".json"
  }

  cleanUpJsonObject: (object)->


  grunt.registerMultiTask "docs", "Get comments from src/*. to docs/_data/*.json", ->
    @files.forEach (file) ->
      filePath = file.src[0]
      coffee = grunt.file.read filePath

      doxObject = dox.parseCommentsCoffee(coffee)

      unless doxObject[0].tags.length > 0
        return

      prettyJSON = JSON.stringify doxObject, undefined, 2

      grunt.file.write file.dest, prettyJSON
