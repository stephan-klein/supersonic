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

  cleanUpDoxObject = (object)->
    betterObject =
      params: []
      # name: undefined
      # description: undefined
      # params: []
      # returns: null
      # usage: null

    for tag in object.tags
      switch tag.type
        when "param"
          betterObject.params.push tag
        when "description"
          betterObject.description = tag.string
        when "name"
          betterObject.name = tag.string
        when "returns"
          betterObject.returns = tag
        when "usage"
          betterObject.usage = tag.string
        when "overview"
          betterObject.overview = true

    betterObject

  grunt.registerMultiTask "docs", "Get comments from src/*. to docs/_data/*.json", ->
    @files.forEach (file) ->
      filePath = file.src[0]
      coffee = grunt.file.read filePath

      doxArray = dox.parseCommentsCoffee(coffee)

      unless doxArray[0].tags.length > 0
        return

      cleanedUpArray = []

      for doxObject in doxArray
        cleanedUpArray.push cleanUpDoxObject(doxObject)


      prettyJSON = JSON.stringify cleanedUpArray, undefined, 2

      grunt.file.write file.dest, prettyJSON
