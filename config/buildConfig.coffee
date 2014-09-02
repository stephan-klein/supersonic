module.exports =
  dir:
    dist: 'lib'
    src: 'src'
    tasks: 'tasks'
    test: 'test'
  files:
    src: '<%= dir.src %>/**/*.coffee'
    test: '<%= dir.test %>/**/*Spec.coffee'