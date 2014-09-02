module.exports = (grunt) ->
  buildConfig = require './config/buildConfig'

  require('load-grunt-config')(grunt, {
    configPath: "#{__dirname}/tasks/config"
    config: buildConfig
  })
  require('load-grunt-tasks')(grunt)

  grunt.loadTasks buildConfig.dir.tasks

  grunt.task.run 'env'
