Steroids&nbsp;Views
===============

- [View](#Steroids%C2%A0Views_view)
- [Views (WebView and PreviewFileView)](#Steroids%C2%A0Views_views)
- [Navigation Bar](#Steroids%C2%A0Views_navigation_bar)
- [Initial View](#Steroids%C2%A0Views_initial_view)
- [Layers](#Steroids%C2%A0Views_layers)
- [Application State](#Steroids%C2%A0Views_application_state)

***

## View

steroids.view represents the current view being shown on the device's screen. The methods and objects below are currently only available when the view is displaying a steroids.views.WebView object.

### Methods

  - steroids.view.displayLoading
  - steroids.view.removeLoading
  - steroids.view.setAllowedRotations
  - steroids.view.setBackgroundColor
  - steroids.view.setBackgroundImage
  - steroids.view.updateKeyboard
  - steroids.view.on
  - steroids.view.off

### Objects

  - steroids.view.navigationBar

***

## Views

In the Steroids Runtime you can have multiple native-wrapped webviews executing at the same time, each displaying its own HTML document. A steroids.views.WebView is an object that represents a single webview. These webviews can be grouped and controlled with Steroids's native navigation controllers. There are three ways to use a `steroids.views.WebView` object:

- As a modal window via `steroids.modal`
- As a navigation stack layer via `steroids.layers`
- As a drawer via `steroids.drawers`

Furthermore, your app has a root WebView configured via the `steroids.config.location` property in the file `config/application.coffee`. If you have tabs enabled, each tab has its own root WebView, defined by the `steroids.config.tabBar.tabs` array. The root WebView can never be popped with steroids.layers.pop. See the [config/application.coffee Guide](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/) for more information.

### Objects
- steroids.views.PreviewFileView
- steroids.views.WebView

***

## Navigation bar

The current view (steroids.view) can have a navigation bar set at its top.  This reduces the vertical space reserved for the view.

The left side of the navigation bar is reserved for the native back button which allows the user to navigate through the `steroids.layers` native navigation stack.
The back button title will be "Back" by default, or the navigation bar title configured in the preceding `steroids.views.*`.

On iOS, the navigation bar appears automatically with steroids.layers.push, but can be set so that it doesn't appear with an option. On Android, steroids.layers.push doesn't show the navigation bar by default.

The navigation bar includes:

 - The back button on the left side, visible only if at least one layer is pushed to `steroids.layers`.
 - An optional title.
 - Optional steroids.buttons.NavigationBarButtons on the right and the left side. (Only one right side button is supported on Android).


### Methods

- steroids.view.navigationBar.show - Show the navigation bar.
- steroids.view.navigationBar.hide - Hide the navigation bar.
- steroids.view.navigationBar.setAppearance - Set the global colors and background images for the navigation bar.
- steroids.view.navigationBar.update - Update the navigation bar content.

### Deprecated Methods

The following was deprecated in Steroids 3.1.4 to favour steroids.view.navigationBar.update:

- steroids.view.navigationBar.setButtons - Set and display navigation bar buttons

### Objects

- steroids.buttons.NavigationBarButton - Represents a navigation bar button.

***

## Initial View

A namespace for methods and properties related to the Intial View of the app.

###Description

The Intial View is a special WebView that is shown before the rest of the app is loaded. It can be effectively used for e.g. session management. The Initial View needs to be defined in `config/application.coffee` – read more in the [Initial View guide](http://academy.appgyver.com/guides/107).

###Methods

- steroids.initialView.show
- steroids.initialView.dismiss

***

<iframe src="http://player.vimeo.com/video/58669216?autoplay=1&loop=1" width="160" height="240" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen style="float:right;"></iframe>

## Layers

Represents the current navigation stack and provides methods to present views in a hierarchical fashion.

### Methods

- steroids.layers.push
- steroids.layers.pop
- steroids.layers.popAll
- steroids.layers.replace
- steroids.layers.on
- steroids.layers.off
***

## Application State

To find out what the state of the application is regarding views, modals and drawers, the method `getApplicationState` may be used.

###Methods

- steroids.getApplicationState

***
