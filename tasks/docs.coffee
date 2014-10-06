dox = require "dox"
_ = require "lodash"

module.exports = (grunt)->

  #grunt.loadNpmTasks "grunt-extend-config"

  grunt.extendConfig
    docs:
      sources:
        expand: true
        cwd: "src/"
        src: "**/navigation-bar.coffee"
        dest: ""
        ext: ""

  cleanUpDoxObject = (object)->
    betterObject =
      params: []
      typedefs: []
      # name: undefined
      # description: undefined
      # params: []
      # returns: null
      # usage: null

    parseDefaultValue = (nameString)->
      nameArray = nameString.split "="
      betterName = nameArray[0]
      defaultValue = nameArray[1] || null
      {name: betterName, defaultValue: defaultValue}

    for tag in object.tags
      switch tag.type
        when "define"
          {name, defaultValue} = parseDefaultValue tag.name
          betterTag =
            name: name
            defaultValue: defaultValue
            description: tag.description
          betterObject.params.push betterTag
        when "type"
          betterObject.type = tag.typeString
        when "typedef"
          betterTag =
            name: tag.name
            description: tag.description
          betterObject.typedefs.push betterTag
        when "description"
          betterObject.description = tag.string
        when "name"
          betterObject.name = tag.string
        when "returns"
          betterTag =
            type: tag.types[0]
            description: tag.description
          betterObject.returns = betterTag
        when "usage"
          betterObject.usage = tag.string
        when "overview"
          betterObject.overview = true
        when "category"
          betterObject.category = tag.string
        when "function"
          betterObject.function = true
        when "signature"
          betterObject.signature = tag.string
        when "usageCoffeeScript"
          betterObject.usageCoffeeScript = tag.string

    betterObject

  cleanUpDoxArray = (doxArray)->
    cleanedUpArray = []

    for doxObject in doxArray
      cleanedUpArray.push cleanUpDoxObject(doxObject)

    cleanedUpArray

  writeArrayToJson = (cleanedUpArray, fileDestination) ->
    prettyJSON = JSON.stringify cleanedUpArray, undefined, 2
    grunt.file.write fileDestination, prettyJSON


  getStringsFromFile = (file) ->
    filePath = file.src[0]
    markdownDestPath = "docs/api/#{file.dest}.md"
    jsonDestPath = "docs/_data/#{file.dest}.json"

    methodString = filePath.substr 0, filePath.lastIndexOf "."
    methodString = methodString.replace /\//g, "."
    methodString = methodString.replace "src.", ""

    {filePath, jsonDestPath, markdownDestPath, methodString}

  grunt.registerMultiTask "docs", "Get comments from src/*. to docs/_data/*.json", ->
    @files.forEach (file) ->
      { filePath
        jsonDestPath
        markdownDestPath
        methodString } = getStringsFromFile(file)

      coffee = grunt.file.read filePath

      doxArray = dox.parseCommentsCoffee(coffee)
      unless doxArray[0].tags.length > 0
        return

      cleanedUpArray = cleanUpDoxArray(doxArray)

      writeArrayToJson(cleanedUpArray, jsonDestPath)

      templatePath = "tasks/templates/api_entry.md"
      template = grunt.file.read templatePath
      markdownOutput = grunt.util._.template(template) {
          module:
            version: "nightly"
            versionHref: "#"
            name: "Lol"
            path: methodString
        }

      grunt.file.write markdownDestPath, markdownOutput
