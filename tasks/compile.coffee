module.exports = (grunt) ->

  grunt.registerTask 'compile-coffee', [
    'coffeelint'
    'gulp:core'
    'gulp:bundle'
    'usebanner'
  ]

  grunt.registerTask 'compile-components', [
    'components'
  ]

  grunt.registerTask 'compile-stylesheets', [
    'gulp:sass'
    'gulp:fonts'
  ]

  grunt.registerTask 'compile-docs', [
    'clean:docs'
    'docs-json'
    'docs-markdown'
  ]
