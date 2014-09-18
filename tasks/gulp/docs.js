var buildConfig = require('../build.config.js');
var cp = require('child_process');
var dgeni = require('dgeni');
var es = require('event-stream');
var fs = require('fs');
var gutil = require('gulp-util');
var htmlparser = require('htmlparser2');
var lunr = require('lunr');
var mkdirp = require('mkdirp');
var path = require('canonical-path');
var projectRoot = path.resolve(__dirname, '../..');
var semver = require('semver');
var yaml = require('js-yaml');

module.exports = function(gulp, argv) {

  if (argv.dist) {
    buildConfig.dist = argv.dist;
  }

  // TODO: Review versions
  var docVersion = argv['doc-version'] || 'nightly';
  if (docVersion != 'nightly' && !semver.valid(docVersion)) {
    console.log('Usage: gulp docs --doc-version=(nightly|versionName)');
    return process.exit(1);
  }

  var config = dgeni.loadConfig(path.resolve(projectRoot, 'config/docs/docs.config.js'));
  config.set('currentVersion', docVersion);
  config.set(
    'rendering.outputFolder',
    argv.dist ? argv.dist : path.resolve(projectRoot, buildConfig.dist, 'supersonic-site')
  );

  return dgeni.generator(config)().then(function() {
    gutil.log('Docs for', gutil.colors.cyan(docVersion), 'generated!');
  });

};
