steroids.screen.capture
=================

  > Takes a screenshot of the entire visible screen.

    steroids.screen.capture({}, {
      onSuccess: function(params) {
        var img = document.createElement('img');
        img.setAttribute('src', params.screenshot)

        document.body.appendChild(img);
      }
    });

Description
-----------

Captures the entire visible portion of the screen and returns the content as a Base64-encoded image for the onSuccess callback function.


Parameters
----------
- __none__


Callbacks
---------
- __onSuccess__: Called when the screen has been captured. The callback parameters contain the captured image in the __screenshot__ property.

Supported Platforms
-------------------

- iOS
