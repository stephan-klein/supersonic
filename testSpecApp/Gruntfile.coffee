###

Default Gruntfile for AppGyver Steroids
http://www.appgyver.com
Licensed under the MIT license.

###

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-steroids"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-shell"
  
  grunt.initConfig
    copy:
      "supersonic-dist":
        src: "../dist/**/*"
        dest: "bower_components/supersonic/dist/"
    shell:
      "supersonic-compile":
        command: "grunt compile-coffee"
        options:
          execOptions:
            cwd: '..'

  grunt.registerTask "default", [
    "shell:supersonic-compile"
    "copy:supersonic-dist"
    "steroids-make-fresh"
  ]