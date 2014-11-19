---
layout: steroids_cli
header_title: Debugging on Android
header_sub_title: Learn how to debug your apps on Android.
section_id: debugging
subsection_id: debugging-on-android
parent_id: steroids
---

# Debugging on Android

Proper remote debugging via the Chrome Web Inspector is available for Android. For Android version 4.0-4.3, it requires that you use a Crosswalk build – see the Android Crosswalk guide for more. For Android 4.4, remote debugging is available for both regular and Crosswalkd builds


## Enable USB debugging on your Android device

To be able to debug your app, you need to enable USB debugging for your Android device. To do so use the following steps:

Android 4.2.2 or later:

1. Go to Android home screen.
2. Pull down the notification bar.
3. Tap "Settings"
4. Tap "About Device"
5. Tap on the "Build Number" button about 7 times.
6. Developer Mode should now be unlocked and available in Settings > More > Developer Options

Android 4.0-4.2.1:

1. Go to Android settings
2. Choose Developer options
3. Enable USB debugging

Android <4.0:

1. Go to Android settings
2. Choose Application
3. Choose Development
4. Enable USB debugging


## Debugging with the Chrome Web Inspector

To inspect your device, connect it to your computer with a USB cable and open `about:inspect` in your desktop Chrome browser. The WebViews running in your app should show up as inspect targets.

### Launch from Steroids CLI

You can also launch the Web Inspector from the CLI by simply typing `cd` or `chrome`.

## Using the Chrome Web Inspector

### Inspecting a WebView

Select a WebView in your app. You now have direct Web Inspector access to it. You can edit the DOM and use the JavaScript console. The console also displays errors and `console.log` output.

If you type in `window.location.reload();`, the WebView reloads itself, which allows you to see network requests and possible console errors that happen when the WebView loads.
