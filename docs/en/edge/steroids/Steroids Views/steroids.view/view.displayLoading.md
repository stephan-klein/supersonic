steroids.view.displayLoading
============================

Calling `steroids.view.displayLoading` will display the [loading.html](http://guides.appgyver.com/steroids/guides/ios/loading-html/) on top of the current WebView. It will stay there until `steroids.view.removeLoading` is called. Note that the loading.html screen is tied to the current WebView – if you do a layer transition (i.e. steroids.layers.push, steroids.layers.pop, steroids.layers.replace and so on), the loading screen will disappear as the current WebView becomes hidden from view.

Quick example
-------------

    steroids.view.displayLoading();

Supported platforms
-------------------
- iOS
