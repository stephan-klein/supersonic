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

- __onFailure__: Called if there are no views to pop or another pop operation is in progress.

Supported Platforms
-------------------

- Android, iOS
