_ = require "lodash"
path = require "path"

module.exports = (grunt)->
  grunt.extendConfig
    "docs-markdown":
      all:
        expand: true
        cwd: "docs/_data/"
        src: "**/*.json"
        dest: "docs/api-reference/nightly/"
        ext: ".md"
        rename: (dest, matchedSrcPath) ->
          betterSrcPath = matchedSrcPath.replace "overview", "index"
          return path.join dest, betterSrcPath

    copy:
      "docs-index":
        expand: true
        cwd: "tasks/templates/docs-index/"
        src: "**/*.md"
        dest: "docs/api-reference/nightly/"

  getLiquidDataPath = (apiEntry) ->
    sanitizedFileName = apiEntry.name.replace ".", "-"
    if apiEntry.class
      sanitizedFileName = "#{sanitizedFileName}-class"
    "site.data.#{apiEntry.namespace}.#{sanitizedFileName}"

  getClassMethodPaths = (apiEntry, liquidDataPath) ->
    classMethodPaths = []
    if apiEntry.methods?.length > 0
      for method in apiEntry.methods
        methodPath = "site.data.#{apiEntry.namespace}.#{apiEntry.name}-#{method}"
        classMethodPaths.push methodPath

    classMethodPaths

  grunt.registerMultiTask "docs-markdown", "Generate API reference markdown from docs/_data/*.json", ->
    @files.forEach (file) =>
      apiEntry = JSON.parse grunt.file.read file.src[0]
      liquidDataPath = getLiquidDataPath(apiEntry)
      section = liquidDataPath.split(".")[3]?.toLowerCase()
      subsection = liquidDataPath.split(".")[4]?.toLowerCase()
      classMethodPaths = getClassMethodPaths apiEntry

      templateType = if apiEntry.overview
        "overview"
      else if apiEntry.component
        "component"
      else if apiEntry.class
        "class"
      else
        "javascript"

      templatePath = "tasks/templates/api_#{templateType}_entry.md"
      template = grunt.file.read templatePath
      markdownOutput = grunt.util._.template(template) {
        liquidDataPath: liquidDataPath
        entry: apiEntry
        section: section
        subsection: subsection
        classMethodPaths: classMethodPaths
      }

      grunt.file.write file.dest, markdownOutput

    grunt.task.run "copy:docs-index"
