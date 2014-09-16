module.exports = (grunt) ->
  grunt.registerTask 'docs', [ 'build' ], ->
    # Generate documentation
    grunt.loadNpmTasks('grunt-ngdocs');

    grunt.task.run [
      'build'
      'ngdocs'
    ]
