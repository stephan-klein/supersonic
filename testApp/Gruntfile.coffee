###

Default Gruntfile for AppGyver Steroids
http://www.appgyver.com
Licensed under the MIT license.

###

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-steroids"
  grunt.loadNpmTasks "grunt-contrib-copy"

  grunt.initConfig
    copy:
      "supersonic-dist":
        src: "../dist/**/*"
        dest: "bower_components/supersonic/dist/"

  grunt.registerTask "default", [
    "copy:supersonic-dist"
    "steroids-make-fresh"
  ]
