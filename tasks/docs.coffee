module.exports = (grunt) ->
  grunt.registerTask 'docs', ->
    # Generate documentation
    console.log 'documentation'
    grunt.loadNpmTasks('grunt-ngdocs');

    grunt.task.run [
      'ngdocs'
    ]
