steroids.tabBar.selectTab
=================

  > Programmatically sets the active tab.

    steroids.tabBar.selectTab(0);

Description
-----------

Programmatically activates the tab with the index given as a parameter. Indexing starts from 0, so the leftmost tab is 0, the next one 1 and so on. If a tab matching the index can't be found, the method fails.

### Full example

    steroids.tabBar.selectTab({
        index: 1
      },
      {
      onSuccess: function() {
        alert("Tab selected");
      },
      onFailure: function() {
        alert("Failed to select tab.")
      }
    });


Parameters
----------
- __index__: index of the tab to be selected

Callbacks
---------
- __onSuccess__: Called once the tab has been selected.
- __onFailure__: Invoked if the tab could not be selected.

Supported Platforms
-------------------

- iOS
