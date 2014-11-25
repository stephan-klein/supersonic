---
layout: steroids_cli
header_title: Debugging Best Practices
header_sub_title: Learn how to debug your apps the proper way.
section_id: debugging
subsection_id: best-practices
parent_id: tooling
---
<section class="docs-section" id="best-practices">
# Debugging best practices
Below is a collection of tips and best practices that we've found useful while debugging apps built with Supersonic and Steroids.

The platform-specific debugging instructions can be found through the links below, but you can also find some quick general tips on debugging here.

* [Debugging on iOS][debugging-ios-guide]
* [Debugging on Android][debugging-android-guide]

## Use `supersonic.logger.log`

The `supersonic.logger.log` function behaves like `console.log`, but outputs directly to the [Connect Screen][connect-screen-guide]. Use it to ensure that a function call is actually reached, to see what values certain variables take, output error messages and so on.

Read more in the [Logging guide][logging-guide].

## Ensure that your HTML5 features are supported

Android (especially if you're using the platform WebView) is still lagging a bit behind iOS on the implementation of certain HTML5 features, and some of the cutting-edge stuff is not available at all on mobile devices.

The website [caniuse.com](http://caniuse.com) has good, up-to-date tables on what features are supported by which platforms. Be sure to check it out before you scratch your head wondering why e.g. `<input type="datetime-local">` just doesn't seem to work on your old Android device.
</section>

[connect-screen-guide]: /tooling/cli/connect-screen/
[debugging-android-guide]: /tooling/cli/debugging/debugging-on-android/
[debugging-ios-guide]: /tooling/cli/debugging/debugging-on-ios/
[logging-guide]: /tooling/cli/debugging/logging/
