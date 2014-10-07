dox = require "dox"
_ = require "lodash"

module.exports = (grunt)->

  #grunt.loadNpmTasks "grunt-extend-config"

  grunt.extendConfig
    docs:
      sources:
        expand: true
        cwd: "src/"
        src: "**/*.coffee"
        dest: ""
        ext: ""

  cleanUpDoxObject = (object)->
    betterObject =
      params: []
      returns: []

    parseDefineTag = (defineTag)->
      nameArray = defineTag.name.split "="
      betterName = nameArray[0]
      defaultValue = nameArray[1] || null

      returns = if defineTag.typeName.match /^=>/
        defineTag.typeName = defineTag.typeName.replace "=>", ""
        true
      else
        false

      {
        name: betterName
        defaultValue: defaultValue
        description: defineTag.description
        type: defineTag.typeName
        returns: returns
        properties: []
      }

    getNamespaceFromTag = (betterTag)->
      namespace = betterTag.name.split(".")[0]
      findTarget = if betterTag.returns
        betterObject.returns
      else
        betterObject.params

      _.find findTarget, (tagName)->
        tagName.name is namespace

    for tag in object.tags
      switch tag.type
        when "define"
          betterTag = parseDefineTag tag
          namespaceObject = getNamespaceFromTag betterTag

          if namespaceObject
            betterTag.name = betterTag.name.split(".")[1]
            namespaceObject.properties.push betterTag
          else
            if betterTag.returns
              betterObject.returns.push betterTag
            else
              betterObject.params.push betterTag
        when "type"
          betterObject.type = tag.typeString
        when "description"
          betterObject.description = tag.string
        when "returnsDescription"
          betterObject.returnsDescription = tag.string
        when "name"
          betterObject.name = tag.string
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
        when "exampleCoffeeScript"
          betterObject.exampleCoffeeScript = tag.string
        when "apiCall"
          betterObject.apiCall = tag.string

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
