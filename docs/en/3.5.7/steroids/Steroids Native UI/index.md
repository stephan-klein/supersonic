Steroids&nbsp;Native&nbsp;UI
============================

<iframe src="http://player.vimeo.com/video/58738235?autoplay=1&loop=1" width="160" height="240" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen style="float: right;"></iframe>

Steroids has some essential native UI elements that are hard or impossible to implement smoothly with pure HTML/JS/CSS. To use these elements, you need to understand the concept of layers first.

## Layers and Views

## Native UI Components

## Events

- visibilitychange - Fired when the view becomes visible.

## Miscellaneous helpers

- steroids.openURL - Open any external URL in browser or any other application installed on the device.
- steroids.buttons are used with steroids.view.navigationBar to configure native navigation bar buttons.
- steroids.statusBar is used to hide and show the native status bar. The native status bar is shown by default.
- steroids.logger - Utility to provide log messages to Steroids console.


## Config Options Related to the Native UI

Some behaviour and styling is configured in the steroids.config, defined in the [`config/application.coffee`](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/) file:

- steroids.config.tabBar
- steroids.config.statusBar
- steroids.config.navigationBar
- steroids.config.theme

## Native Transition Animations

Transition animations that can be used with navigation elements are also available to use without _actual_ navigation.

- steroids.Animation - Transition animations
