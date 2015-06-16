steroids.view.setBackgroundColor
=================================

Sets a color for the current view's background, behind the WebView container rendering your HTML document. The background color will be visible if you drag your view past its top or bottom edge.

If you set the `background-color: 'transparent'` CSS property for your HTML page's `body` (and other elements as necessary), the background color will be visible under your HTML content.

See also steroids.view.setBackgroundImage.

Quick example
-------------

    steroids.view.setBackgroundColor("#FFF")

Full example
------------

    steroids.view.setBackgroundColor("#FFFFFF");

Parameters
----------

- __color__: The color to which the app background will be set. Either a 3 or 6 character hex string, e.g. "#00AEEF" or "#000". Initial value is "#5C6367".

Callbacks
---------

None.

Supported platforms
-------------------

- iOS
