steroids.layers.popAll
======================

Pops all views except for the root view from the layer stack.

    steroids.layers.popAll();

Description
-----------

This function pops all views except for the initial root view from the layer stack. If the current layer stack contains only the root view, the function fails with the `onFailure` callback.


Parameters
----------

- _none_

Callbacks
---------

- __onSuccess__: Called if the pop operation is successful.
- __onFailure__: Called if there are no views to pop or another pop operation is in progress.
- __onTransitionStarted__: Called when the transition is succesfully started. iOS only.
- __onTransitionEnd__: Called when the transition is succesfully completed. iOS only.

Supported Platforms
-------------------

- Android, iOS
