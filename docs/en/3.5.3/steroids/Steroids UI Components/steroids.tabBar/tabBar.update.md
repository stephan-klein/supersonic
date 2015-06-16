steroids.tabBar.update
=================

  > Updates the appearance of the tabs (title, icon image and badge) in the native tab bar.

    steroids.tabBar.update({
      tabs: [
        {
          title: "Steroids",
          icon: "icons/pill@2x.png",
          badge: "1"
        },
        {
          title: "Telescope",
          icon: "icons/telescope@2x.png"
        }
      ]
    });

Description
-----------

Updates the titles and/or icon images and/or badges of the tabs in the native tab bar the the given parameter values application wide. If no parameters are given for a property, the previous value will be used, e.g. if no `title` is given, `title` will not be updated.

See also steroids.tabBar.currentTab.update for updating the currently selected tab.

### Full example

    steroids.tabBar.update({
        tabs: [
          {
            title: "Steroids",
            icon: "icons/pill@2x.png",
            badge: "1"
          },
          {
            title: "Telescope",
            icon: "icons/telescope@2x.png"
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
- __tabs__: tabBar.update accepts a single array of tab objects as a parameter. The array needs to contain as many tab objects as there are in the original tab bar. A tab object contains the following properties:
  * __title__: text shown in the tab title.
  * __icon__: path to the tab’s icon file relative to the dist/ folder
  * __badge__: String text/number shown in the tab notification badge. To hide the badge, set it to an empty String: `""`

Callbacks
---------
- __onSuccess__: Called once the tab bar has been updated.
- __onFailure__: Invoked if the tab bar could not be updated.

Supported Platforms
-------------------

- iOS
