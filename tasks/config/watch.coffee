module.exports =
  test:
    files: [
      '<%= files.src %>'
      '<%= files.test %>'
    ]
    tasks: [
      'coffeelint'
      'test'
    ]
  build:
    files: [
      '<%= files.src %>'
    ]
    tasks: [
      'build'
    ]
