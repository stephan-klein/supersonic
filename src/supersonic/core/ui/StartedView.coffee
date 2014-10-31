# Source code in ui/views.coffee

###
 # @namespace supersonic.ui
 # @name StartedView
 # @class
 # @description
 # A Supersonic StartedView. StartedViews are created by calling a View's `start()` function. A StartedView remains in memory and continues to run, execute JavaScript etc. even when it is not in any navigation stack or used in a drawer. Read more in the [Started Views guide](/ui-and-navigation/views/started-views/).
 # @type
 # StartedView: {
 #   getId: () => String
 #   stop: () => Promise
 # }
 # @define {Function} getId Returns the id of the the StartedView.
 # @define {Function} stop Stop the StartedView. It will be destroyed and any memory used freed. A StartedView that is in the [navigation stack](/ui-and-navigation/navigation/navigation-stack/) cannot be stopped.
###
