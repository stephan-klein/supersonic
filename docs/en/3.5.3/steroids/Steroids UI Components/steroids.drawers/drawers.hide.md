steroids.drawers.hide
=====================

> Dismisses any currently open drawer.

    steroids.drawers.hide();

Description
-----------

`steroids.drawers.hide` dismisses any currently open drawer.

*There is currently a known issue in the v3.1.5 App Store Scanner where `steroids.drawers.hide` only works when both left and right drawers are present. If only one drawer is present, the failure callback will be erroneously triggered. The issue has been fixed for builds requested in the Build Service, and will be fixed for good with Scanner v3.1.6. See the [GitHub issue](https://github.com/AppGyver/steroids/issues/268) for details and updates.*

The method can also be used to replace the center view with another (preloaded) WebView.

Full Example
------------

    var indexView2 = new steroids.views.WebView("index2.html");
    indexView2.preload({},
      {
        onSuccess: hideDrawer
      }
    );

    function hideDrawer() {
      steroids.drawers.hide({
        center: indexView2
      }, {
        onSuccess: function() {
          alert("Drawer dismissed");
        },
        onFailure: function(error) {
          alert("Could not dismiss the drawer: " + error.errorDescription);
        }
      });
    }


Parameters
----------

- __center__: A preloaded steroids.views.WebView (see steroids.view.preload) that will be used to replace the current center view after the drawer closes. Passing a non-preloaded WebView will close the drawer but not replace the center view. If defined, sets `fullChange: true` regardless of the parameter used in the API call. This is required to ensure the center view is replaced smoothly, i.e. while it is hidden from view.
- __fullChange__: If `true`, the drawer will extend to cover the entire screen before closing.

Callbacks
---------

- __onSuccess__: Called once the drawer starts to animate away from the screen.
- __onFailure__: Called if the drawer could not be dismissed or no drawer is open. Another animation may be in progress.

Supported Platforms
-------------------

- iOS
