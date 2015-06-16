steroids.analytics.track
==============================

  > Records a single event into the AppGyver Analytics platform.

    steroids.analytics.track({ action: "test", id: 1 });

Description
-----------

An app's events can be viewed in the app's Dashboard (the app has to be built into AppGyver Cloud).

If the device is online, events will be sent to AppGyver Analytics as they occur.

When the device is offline, events are recorded normally, but persisted on the device. The next time the device is online while the app is open, the recorded events will be sent to AppGyver Analytics.

Full Example
------------

    steroids.analytics.track({
        action: "test",
        id: 1,
        important: true
    }
    }, {
      onSuccess: function() {
        alert("Event was recorded successfully");
      },
      onFailure: function(error) {
        alert("Event could not be recorded: " + error.errorDescription);
      }
    });

Parameters
----------

- An arbitrary JavaScript object containing any number of properties with string, integer or boolean values.

Callbacks
---------

- __onSuccess__: Called when the event has been stored to the recording queue successfully.
- __onFailure__: Invoked if the event could not be recorded, this should never happen.

Supported Platforms
-------------------

- iOS
