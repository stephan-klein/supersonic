gulp = require "gulp"
sass = require "gulp-sass"
concat = require "gulp-concat"
browserify = require "gulp-browserify"

buildConfig = require "../../config/buildConfig.coffee"

module.exports =
  sass: ->
    gulp.src("#{buildConfig.dir.sass}/supersonic.scss")
      .pipe(sass())
      .pipe(concat("supersonic.css"))
      .pipe(gulp.dest("#{buildConfig.dir.dist}/css"))

  core: ->
    gulp.src("#{buildConfig.dir.src}/supersonic/core.coffee", read: false)
      .pipe(browserify(
        transform: ['coffeeify']
        extensions: ['.coffee']
      ))
      .pipe(concat 'supersonic.core.js')
      .pipe(gulp.dest "#{buildConfig.dir.dist}")

  bundle: ->
    gulp.src("#{buildConfig.dir.src}/supersonic.coffee", read: false)
      .pipe(browserify(
        transform: ['coffeeify']
        extensions: ['.coffee']
      ))
      .pipe(concat 'supersonic.js')
      .pipe(gulp.dest "#{buildConfig.dir.dist}")
