gulp = require "gulp"
sass = require "gulp-sass"
concat = require "gulp-concat"
browserify = require "gulp-browserify"

buildConfig = require "../../config/buildConfig.coffee"

module.exports =
  sass: ->
    gulp.src("scss/supersonic.scss")
      .pipe(sass())
      .pipe(concat("supersonic.css"))
      .pipe(gulp.dest("#{buildConfig.dir.dist}/css"))

  coffee: ->
    gulp.src("#{buildConfig.dir.src}/supersonic.coffee", read: false)
      .pipe(browserify(
        transform: ['coffeeify']
        extensions: ['.coffee']
      ))
      .pipe(concat 'supersonic.js')
      .pipe(gulp.dest "#{buildConfig.dir.dist}")