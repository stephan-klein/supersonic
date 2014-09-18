// var GithubApi = require('github');
var gulp = require('gulp');
// var path = require('canonical-path');
// var pkg = require('./package.json');
// var request = require('request');
// var q = require('q');
// var semver = require('semver');
// var through = require('through');
//
var argv = require('minimist')(process.argv.slice(2));
//
// var _ = require('lodash');
// var buildConfig = require('./config/build.config.js');
// var changelog = require('conventional-changelog');
// var es = require('event-stream');
// var irc = require('ircb');
// var marked = require('marked');
// var mkdirp = require('mkdirp');
// var twitter = require('node-twitter-api');
//
// var cp = require('child_process');
// var fs = require('fs');
//
// var concat = require('gulp-concat');
// var footer = require('gulp-footer');
// var gulpif = require('gulp-if');
// var header = require('gulp-header');
// var jshint = require('gulp-jshint');
// var minifyCss = require('gulp-minify-css');
// var rename = require('gulp-rename');
// var sass = require('gulp-sass');
// var stripDebug = require('gulp-strip-debug');
// var template = require('gulp-template');
// var uglify = require('gulp-uglify');
// var gutil = require('gulp-util');


/**
 * Load Docs Tasks
 */
require('./tasks/gulp/docs')(gulp, argv);

gulp.task('default', ['docs']);
