steroids.screen.freeze
=================

  > Freezes the device screen and application UI.

    steroids.screen.freeze();

Description
-----------

Freezes the device screen and application UI so that the current contents of the screen are "frozen" in place and the app UI doesn't respond to user gestures.  During the freeze, all JavaScript used in the application keeps executing. Thus, this method can be used to reduce flickering in the application when the screen contents are updated (e.g. new data is fetched and the DOM changes).  The screen needs to be unfrozen with steroids.screen.unfreeze to make the UI responsive again and update the screen contents.

Parameters
----------
- __none__

Callbacks
---------
- __none__

Supported Platforms
-------------------

- iOS
