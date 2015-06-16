steroids.drawers
================

> A namespace for methods and properties that manage the left and right drawers used by the application.


Description
-----------

A drawer is a separate WebView that is rendered on the screen at the same time and independently from your main WebView. By default, a drawer is hidden from view, but can be opened – that is, brought to view – either programmatically via steroids.drawers.show or by a touch gesture. Drawers are application-wide, so they will work the same regardless of which tab is open or which WebView is the topmost in your layer stack. They are useful for e.g. providing a navigation menu for your app.

Steroids supports drawers on the left and right side of the screen, with multiple options for animations, touch gestures etc – see steroids.drawers.update for a list.


Methods
-------

- steroids.drawers.update
- steroids.drawers.show
- steroids.drawers.hide
- steroids.drawers.on
- steroids.drawers.off

Deprecated methods
------------------

The following methods were deprecated in Steroids.js v3.1.9 in favor of steroids.drawers.update:

- steroids.drawers.enableGesture
- steroids.drawers.disableGesture

Properties
----------

- steroids.drawers.defaultAnimations
