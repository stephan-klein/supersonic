module.exports =
  build:
    files: [
      '<%= files.src %>'
      '<%= files.stylesheets %>'
      '<%= files.components %>'
    ]
    tasks: [
      'build'
    ]

  test:
    files: [
      '<%= files.src %>'
      '<%= files.test %>'
    ]
    tasks: [
      'coffeelint'
      'test'
    ]

  coffee:
    files: [
      '<%= files.src %>'
    ]
    tasks: [
      'compile-coffee'
    ]
  stylesheets:
    files: [
      '<%= files.stylesheets %>'
    ]
    tasks: [
      'compile-stylesheets'
    ]
  components:
    files: [
      '<%= files.components %>'
    ]
    tasks: [
      'compile-components'
    ]
  docs:
    files: [
      '<%= files.src %>'
      'tasks/templates/'
    ]
    tasks: [
      'compile-docs'
    ]
