steroids.splashscreen.hide
=================

  > Hides the splashscreen.

    steroids.splashscreen.hide();

Description
-----------

Hides the splashscreen programmatically. Hiding the initial splashscreen programmitically requires the `<preference name="AutoHideSplashScreen" value="false" /> preference to be set in `config.ios.xml`.

**Known issue:** When using the Scanner app, hiding the initial splashscreen with `steroids.splashscreen.hide` only works when the Scanner app is opened for the first time. When refreshing or restarting the app in Scanner, the splashscreen functions inconsistently – you have to restart the whole Scanner app to get the expected behavior again. This does not occur in Ad Hoc or App Store builds.

### Full example

    steroids.splashscreen.hide({}, {
      onSuccess: function() {
        alert("Splashscreen hidden");
      },
      onFailure: function() {
        alert("Failed to hide splashscreen.")
      }
    });


Parameters
----------
- __none__

Callbacks
---------
- __onSuccess__: Called once the splashscreen has been hidden.
- __onFailure__: Invoked if the splashscreen could not be hidden.

Supported Platforms
-------------------

- iOS
