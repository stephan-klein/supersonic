###

Default Gruntfile for AppGyver Steroids
http://www.appgyver.com
Licensed under the MIT license.

###

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-steroids"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-clean"

  grunt.loadTasks(__dirname + "/node_modules/grunt-steroids/tasks/module-env")

  grunt.initConfig
    clean:
      "supersonic-dist":
        "#{__dirname}/bower_components/supersonic/"
    copy:
      "supersonic-dist":
        expand: true
        cwd: "../dist/"
        src: "**/*.*"
        dest: "#{__dirname}/bower_components/supersonic/"

  grunt.registerTask "default", [
    "clean:supersonic-dist"
    "copy:supersonic-dist"
    "steroids-make-fresh"
    "steroids-copy-module-dependencies"
  ]
