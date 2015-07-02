module.exports = (grunt) ->
  grunt.registerTask 'build', [
    'build-dist'
    'compile-docs'
  ]

  grunt.registerTask 'build-dist', [
    'clean:build'
    'compile-coffee'
    'compile-components'
    'compile-stylesheets'
  ]
