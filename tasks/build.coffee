module.exports = (grunt) ->
  grunt.registerTask 'build', [
    'clean:build'
    'compile-coffee'
    'compile-components'
    'compile-stylesheets'
    'compile-docs'
  ]
