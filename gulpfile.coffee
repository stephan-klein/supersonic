gulp = require "gulp"
sass = require "gulp-sass"
concat = require "gulp-concat"
buildConfig = require "config/buildConfig.coffee"


gulp.task "default", ["build"]
gulp.task "build", ["sass"]

gulp.task "sass", () ->
  gulp.src("scss/supersonic.scss")
    .pipe(sass())
    .pipe(concat("supersonic.css"))
    .pipe(gulp.dest("#{buildConfig.dir.dist}/css"))
