module.exports = (grunt) ->
  grunt.registerTask 'docsGenerating', ->
    # Generate documentation
    grunt.loadNpmTasks('grunt-ngdocs');

    grunt.task.run [
      'ngdocs'
    ]

  grunt.registerTask 'docs', [
    'build'
    'docsGenerating'
  ]
