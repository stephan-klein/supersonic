module.exports =
  dir:
    dist: 'dist'
    sass: 'scss'
    src: 'src'
    tasks: 'tasks'
    test: 'test'
    testApp: "testApp/www"
    components: "components/*"
  files:
    src: '<%= dir.src %>/**/*.coffee'
    test: '<%= dir.test %>/**/*Spec.coffee'
  file:
    componentImport: '<%= dir.dist %>/components/import.html'
