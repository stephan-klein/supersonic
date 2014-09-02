/*
 * Default Gruntfile for AppGyver Steroids
 * http://www.appgyver.com
 *
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  grunt.loadNpmTasks("grunt-steroids");

  grunt.initConfig({
    copy: {
      "supersonic-dist": {
        src: "../dist/**/*",
        dest: "www/components/supersonic/dist/"
      }
    }
  });

  grunt.registerTask("default", [
    "steroids-make",
    "steroids-compile-sass",
    "copy"
  ]);

};
