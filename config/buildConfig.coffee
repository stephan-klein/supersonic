module.exports =
  dir:
    dist: 'dist'
    src: 'src'
    tasks: 'tasks'
    test: 'test'
    testApp: "testApp/www"
  files:
    src: '<%= dir.src %>/**/*.coffee'
    test: '<%= dir.test %>/**/*Spec.coffee'
