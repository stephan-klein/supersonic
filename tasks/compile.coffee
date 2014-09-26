module.exports = (grunt) ->

  grunt.registerTask 'compile-coffee', [
    'coffeelint'
    'gulp:core'
    'gulp:bundle'
  ]

  grunt.registerTask 'compile-components', [
    'components'
  ]

  grunt.registerTask 'compile-stylesheets', [
    'gulp:sass'
  ]

  grunt.registerTask 'compile-docs', [
    'docs'
  ]
