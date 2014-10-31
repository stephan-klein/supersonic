# Source code in ui/view.coffee

###
 # @namespace supersonic.ui
 # @name View
 # @class
 # @description
 # A Supersonic View. A View is a pointer to a specific location (route or URL). A View can be passed as an argument to other API calls (like `supersonic.ui.layers.push`). Read more in the [View guide](/ui-and-navigation/html-views/).
 # @type
 # View: {
 #   getLocation: () => String
 #   start: (String) => StartedView
 # }
 # @define {Function} getLocation Returns the View's location String.
 # @define {Function} start Shorthand for calling `supersonic.ui.views.start(view, id)` with this view.
###
