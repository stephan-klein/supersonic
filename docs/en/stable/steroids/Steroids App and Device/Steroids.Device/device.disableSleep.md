steroids.device.disableSleep
============================

> Disable the device from entering sleep mode when idle

### Quick example

    steroids.device.disableSleep()

### Description

By default, AppGyver Scanner has disabled the sleep mode to allow hands-free development.

In standalone applications, the sleep mode is enabled by default.

### Full example

    steroids.device.disableSleep({}, {
      onSuccess: function() {
        alert("Sleep mode disabled");
      }
    });

Callbacks
---------
  - __onSuccess__: Called once the sleep mode has been disabled.

Platforms
---------
  - iOS
