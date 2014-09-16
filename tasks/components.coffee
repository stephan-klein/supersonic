coffee = require "coffee-script"
path = require "path"

module.exports = (grunt) ->
  async = grunt.util.async

  grunt.registerTask 'components', "compile components and create core component", ->
    done = this.async()
    coreComponents = []

    componentDirectories = grunt.file.expand grunt.config.get("dir.components")

    async.forEach componentDirectories, (componentDirectory, cb)->
      coreComponent = {
        name: componentDirectory.split("/")[1]
        path: null
        javascript: null
        html: null
      }

      grunt.file.recurse componentDirectory, (abspath, rootdir, subdir, filename)->

        if /\.html/.test filename
          coreComponent.path = abspath
          coreComponent.html = grunt.file.read abspath
        else if /\.coffee/.test filename
          coreComponent.javascript = coffee.compile grunt.file.read(abspath)

        if coreComponent.html? and coreComponent.javascript?
          coreComponents.push coreComponent
          cb()

    , ()->

      coreComponentSources = []
      for component in coreComponents
        coreComponentSources.push "#{component.html}\n<script>\n#{component.javascript}\n</script>"

      grunt.file.write grunt.config.get("file.componentImport"), coreComponentSources.join("\n\n")
      grunt.log.writeln "#{grunt.config.get("file.componentImport")} created."

      done()
