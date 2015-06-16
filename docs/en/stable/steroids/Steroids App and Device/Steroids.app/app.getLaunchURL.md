steroids.app.getLaunchURL
=========================

  > Returns the string that was used to launch the application with URL scheme.

    steroids.app.getLaunchURL();

Description
-----------

When the application has launched, the URL used to launch can be read with this function. In production mode this requires that the application has registered a custom URL scheme for the application launch in the AppGyver Build Service – see the [custom URL Scheme guide](http://guides.appgyver.com/steroids/guides/steroids-js/custom-url-schemes/) for more information.

Supported Platforms
-------------------

- iOS, Android