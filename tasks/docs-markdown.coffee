dox = require "dox"
_ = require "lodash"
path = require "path"

module.exports = (grunt)->
  grunt.extendConfig
    "docs-markdown":
      all:
        expand: true
        cwd: "docs/_data/supersonic/"
        src: "**/*.json"
        dest: "docs/api-reference/nightly/"
        ext: ".md"
        rename: (dest, matchedSrcPath) ->
          betterSrcPath = matchedSrcPath.replace "overview", "index"
          return path.join dest, betterSrcPath

  getLiquidDataPath = (filePath)->
    liquidDataPath = filePath.replace "docs/_data/", "site.data."
    liquidDataPath = liquidDataPath.replace /\//g, "."
    liquidDataPath = liquidDataPath.replace ".json", ""
    liquidDataPath

  grunt.registerMultiTask "docs-markdown", "Generate API reference markdown from docs/_data/*.json", ->
    @files.forEach (file) =>
      apiMethod = JSON.parse grunt.file.read file.src[0]
      liquidDataPath = getLiquidDataPath(file.src[0])

      templateType = if apiMethod.overview
        "overview"
      else
        "javascript"

      templatePath = "tasks/templates/api_#{templateType}_entry.md"
      template = grunt.file.read templatePath
      markdownOutput = grunt.util._.template(template) {
        liquidDataPath: liquidDataPath
        method: apiMethod
      }

      grunt.file.write file.dest, markdownOutput
