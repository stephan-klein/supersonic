steroids.tabBar.replace
=================

  > Replaces the tabs with new ones specified by the options object.

    steroids.tabBar.replace({
      tabs: [
        {
          title: "Steroids",
          icon: "icons/pill@2x.png",
          location: "index.html"
        },
        {
          title: "Telescope",
          icon: "icons/telescope@2x.png",
          location: "http://www.google.com"
        }
      ]
    });

Description
-----------

Replaces the tabs in the native tab bar with given parameter values application wide. Requires that all parameters be set correctly
### Full example

    steroids.tabBar.replace({
      tabs: [
        {
          title: "Steroids",
          icon: "icons/pill@2x.png",
          location: "index.html"
        },
        {
          title: "Telescope",
          icon: "icons/telescope@2x.png",
          location: "http://www.google.com"
        }
      ]
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
- __tabs__: tabBar.replace accepts a single array of tab objects as a parameter. A tab object contains the following properties:
  * __title__: text shown in the tab title.
  * __icon__: path to the tab’s icon file relative to the dist/ folder
  * __location__: the path to the view to be shown

Callbacks
---------
- __onSuccess__: Called once the tab bar has been updated.
- __onFailure__: Invoked if the tab bar could not be updated.

Supported Platforms
-------------------

- iOS
