module.exports = (grunt) ->
  grunt.registerTask 'docs:generate', ->
    # Generate documentation
    grunt.loadNpmTasks('grunt-ngdocs');

    grunt.task.run [
      'ngdocs'
    ]

  grunt.registerTask 'docs:connect', ->

    grunt.task.run [
      'docs'
      'connect:docs'
      'watch:docs'
    ]

  grunt.registerTask 'docs', [
    'build'
    'docs:generate'
  ]
