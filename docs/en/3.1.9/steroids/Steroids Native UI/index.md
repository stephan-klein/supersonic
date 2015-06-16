Steroids&nbsp;Native&nbsp;UI
============================

<iframe src="http://player.vimeo.com/video/58738235?autoplay=1&loop=1" width="160" height="240" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen style="float: right;"></iframe>

Steroids has some essential native UI elements that are hard or impossible to implement smoothly with pure HTML/JS/CSS. To use these elements, you need to understand the concept of layers first.

##Relevant Guides

* [Steroids preferences in config/application.coffee](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/) (setting up your app's initial location, changing UI colors, enabling tabs)
* [Using loading.html (iOS)](http://guides.appgyver.com/steroids/guides/ios/loading-html/) and [Using loading.png (Android)](http://guides.appgyver.com/steroids/guides/ios/loading-html/) (used with the `keepLoading` option of steroids.layers.push and steroids.modal.show, see also steroids.view.removeLoading)

## Layers and Views

In the Steroids Runtime you can have multiple native-wrapped webviews executing at the same time, each displaying its own HTML document. A steroids.views.WebView is an object that represents a single webview. These webviews can be grouped and controlled with Steroids's native navigation controllers. There are three ways to use a `steroids.views.WebView` object:

- As a modal window via `steroids.modal`
- As a navigation stack layer via `steroids.layers`
- As a drawer via `steroids.drawers`

Furthermore, your app has a root WebView configured via the `steroids.config.location` property in the file `config/application.coffee`. If you have tabs enabled, each tab has its own root WebView, defined by the `steroids.config.tabBar.tabs` array. The root WebView can never be popped with steroids.layers.pop. See the [config/application.coffee Guide](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/) for more information.

### Objects and Namespaces Related to Views

- steroids.view – The current view
- steroids.view.navigationBar – implements a control for navigating hierarchical content, presenting a title for the view etc.  Navigation bar can be used with or without a tab bar.
- steroids.views.WebView  - A single webview
- steroids.views.PreviewFileView  - A view used to preview a file
- steroids.screen - Handling the visible screen
- steroids.splashscreen - Handling the splash screen

## Native Navigation Controllers

These elements control the structure and flow of the application.

- steroids.tabBar is enabled by defining `steroids.config.tabBar` in [`config/application.coffee`](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/#steroidsconfigtabbar). By default, the tab bar is shown on the screen at all times. The tab bar can be programmatically hidden, shown and updated application-wide. Each tab has its own view hierarchy and own (if any) steroids.view.navigationBar.
- steroids.layers represents the current navigation stack and provides methods to present views in a hierarchical fashion.
- steroids.modal provides methods to temporarily present a view on top of the whole application.
- steroids.drawers provides methods to temporarily present a view as a "drawer" opening from one of the edges of the device screen.

## Events

- visibilitychange - Fired when the view becomes visible.

## Miscellaneous helpers

- steroids.openURL - Open any external URL in browser or any other application installed on the device.
- steroids.buttons are used with steroids.view.navigationBar to configure native navigation bar buttons.
- steroids.statusBar is used to hide and show the native status bar. The native status bar is shown by default.


## Config Options Related to the Native UI

Some behaviour and styling is configured in the steroids.config, defined in the [`config/application.coffee`](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/) file:

- steroids.config.tabBar
- steroids.config.statusBar
- steroids.config.navigationBar
- steroids.config.theme

## Native Transition Animations

Transition animations that can be used with navigation elements are also available to use without _actual_ navigation.

- steroids.Animation - Transition animations
