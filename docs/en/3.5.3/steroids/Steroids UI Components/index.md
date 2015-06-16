Steroids&nbsp;UI&nbsp;Components
====================

- [Tab bar](#Steroids%C2%A0UI%C2%A0Components_tab_bar)
- [Modal](#Steroids%C2%A0UI%C2%A0Components_modal)
- [Drawers](#Steroids%C2%A0UI%C2%A0Components_drawers)
- [Buttons](#Steroids%C2%A0UI%C2%A0Components_buttons)
- [Animations](#Steroids%C2%A0UI%C2%A0Components_native_transition_animations)

***

## Config Options Related to the Native UI

Some behaviour and styling is configured in the steroids.config, defined in the [`config/application.coffee`](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/) file:

- steroids.config.tabBar
- steroids.config.statusBar
- steroids.config.navigationBar
- steroids.config.theme

***

## Tab bar

The native tab bar needs to be enabled by defining `steroids.config.tabBar` in `config/application.coffee`. By default, the tab bar that is shown on the screen in all views, with each tab pointing to a separate WebView. See the [`config/application.coffee`](http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/#steroidsconfigtabbar) guide for more information. Note that the tab bar is also available on Android, but cannot be shown, hidden or updated programmatically.


### Methods

  - steroids.tabBar.hide
  - steroids.tabBar.show
  - steroids.tabBar.update
  - steroids.tabBar.replace
  - steroids.tabBar.selectTab
  - steroids.tabBar.currentTab.update
  - steroids.tabBar.on
  - steroids.tabBar.off

Supported only for iOS.

***

<iframe src="http://player.vimeo.com/video/58669801?autoplay=1&loop=1" width="160" height="240" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen style="float:right;margin-left:10px;"></iframe>

## Modal

Provides methods to temporarily present a view on top of the whole application. Only one modal window can be active at a time.

Modal window shows any `steroids.views.*` object.

### Methods

- steroids.modal.show
- steroids.modal.hide
- steroids.modal.hideAll
- steroids.modal.on
- steroids.modal.off

***

<iframe src="http://player.vimeo.com/video/65635561?autoplay=1&loop=1" width="160" height="240" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen style="float:right;margin-left:10px;"></iframe>

## Drawers

Only one drawer window per edge can be active at a time.  Closing the drawer by tapping the original view that opened the drawer does not currently work, use steroids.drawers.hide instead or steroids.drawers.enableGesture where "tap to hide" works.


### Methods

- steroids.drawers.update
- steroids.drawers.show
- steroids.drawers.hide
- steroids.drawers.on
- steroids.drawers.off

### Deprecated methods

The following methods were deprecated in Steroids.js v3.1.9 in favor of steroids.drawers.update:

- steroids.drawers.enableGesture
- steroids.drawers.disableGesture

### Properties

- steroids.drawers.defaultAnimations

***

## Buttons

Native UI buttons.


### Objects
 - steroids.buttons.NavigationBarButton

***

## Native Transition Animations

Transition animations that can be used with navigation elements are also available to use without _actual_ navigation.

- steroids.Animation - Transition animations

***