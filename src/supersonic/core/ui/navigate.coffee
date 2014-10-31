###
 # @namespace supersonic.ui
 # @name navigate
 # @function
 # @description
 # Navigates to the given [route](/ui-and-navigation/navigation/routes/) or URL. Alternatively, you can pass in a [StartedView id](/ui-and-navigation/views/started-views/). Shorthand for calling `supersonic.ui.layers.push` with a View or StartedView.
 # @usageJavaScript
 # supersonic.ui.navigate(locationOrId)
 # @type
 # navigate: (
 #   locationOrId: String
 # ) => Promise
 # @define {String} locationOrId: A [route](/ui-and-navigation/navigation/routes/), full URL or [StartedView id](/ui-and-navigation/views/started-views/) to be navigated to. The special `#back` route will go back in the navigation stack, triggering `supersonic.ui.layers.pop` internally. The special `#root` route will go back to the [root view](/ui-and-navigation/views/root-view/).
 # @returnsDescription
 # A promise that will be resolved once the navigation commences. If the target location or id is invalid, the promise will be rejected.
 # @exampleJavaScript
 # // Via route
 # supersonic.ui.navigate("cars#show");
 #
 # // Via id
 # supersonic.ui.navigate("carsShowView");
 #
 # // Via URL
 # supersonic.ui.navigate("http://www.google.com");
 #
 # // Go back to the previous view
 # supersonic.ui.navigate("#back");
 #
 # // Go back to the root view
 # supersonic.ui.navigate("#root");
###
