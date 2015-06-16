steroids.device.enableSleep
============================

> Enable the device to enter sleep mode when idle

### Quick example

    steroids.device.enableSleep()

### Description

By default, AppGyver Scanner has disabled the sleep mode to allow hands-free development.

In standalone applications, the sleep mode is enabled by default.

### Full example

    steroids.device.enableSleep({}, {
      onSuccess: function() {
        alert("Sleep mode enabled");
      }
    });

Callbacks
---------
  - __onSuccess__: Called once the sleep mode has been enabled.

Platforms
---------
  - iOS
