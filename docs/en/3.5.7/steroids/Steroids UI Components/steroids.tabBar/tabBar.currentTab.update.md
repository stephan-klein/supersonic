steroids.tabBar.currentTab.update
=================

  > Updates the appearance of the currently selected tab in the native tab bar.

    steroids.tabBar.currentTab.update({
      title: "Steroids",
      icon: "icons/pill@2x.png",
      badge: "1"
    });

Description
-----------

Updates the titles and/or icon images and/or badges of the currently selected tab in the native tab bar with the the given parameter values application wide. If no parameters are given for a property, the previous value will be used, e.g. if no `title` is given, `title` will not be updated.

### Full example

    steroids.tabBar.update({
      title: "Steroids",
      icon: "icons/pill@2x.png",
      badge: "1"
    },
    {
      onSuccess: function() {
        alert("Tab bar updated");
      },
      onFailure: function() {
        alert("Failed to update tab bar.")
      }
    });


Parameters
----------
  * __title__: text shown in the tab title.
  * __icon__: path to the tab’s icon file relative to the `dist/` folder
  * __badge__: String text/number shown in the tab notification badge. To hide the badge, set it to an empty String: `""`

Callbacks
---------
- __onSuccess__: Called once the tab bar has been updated.
- __onFailure__: Invoked if the tab bar could not be updated.

Supported Platforms
-------------------

- iOS
- Android
