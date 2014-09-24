module.exports = (grunt) ->
  grunt.registerTask 'build', [
    'clean'
    'compile-coffee'
    'compile-components'
    'compile-stylesheets'
    'compile-docs'
  ]
