module.exports =
  bower:
    options:
      position: 'top'
      banner: """
        /**
         * <%= pkg.name %>
         * Version: <%= pkg.version %>
         * Published: <%= grunt.template.today("yyyy-mm-dd") %>
         * Homepage: <%= pkg.homepage %>
         * License: <%= pkg.license %>
         */
        """
      linebreak: true
    files: {
      src: ["<%= dir.dist %>/*.js"]
    }