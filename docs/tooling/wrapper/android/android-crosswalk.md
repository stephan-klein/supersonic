---
layout: steroids_wrapper
parent_id: tooling
section_id: android
subsection_id: android-crosswalk
---

<section class="docs-section" id="android-crosswalk">
#Android Crosswalk

## Related guides

- [Android feature table][android-feature-table]
- [And check out the blog: Chromium Crosswalk: A huge boost to hybrid-apps on Android.][blog-post]

The Android runtime includes the ability to use [Crosswalk](https://crosswalk-project.org/) for your app's WebViews, in place of the regular Android WebViews. Crosswalk utilises Chromium, which is an open source web browser project that is used e.g. in Google Chrome – it's significantly more bleeding-edge compared to the default Android web browser. Crosswalk WebViews are supported on Android 4.0 and newer (SDK version 14+).

The choice between Crosswalk and the regular Android WebViews is done when the app binary is built. The default Scanner app from Google Play is built with Crosswalk and we recommend you to use Crosswalk when building your app.

The benefits include much broader support for new HTML5 features, 2-3x better rendering performance compared to regular WebViews, remote debugging and more consistent behaviour (since the WebView engine used doesn't depend on the device's Android version).

When your app binary is using Crosswalk, all WebViews automatically use it, so you don't need to touch your HTML5 code.

## Debugging

See the [Debugging on Android][debugging-guide] guide.

## Crosswalk Gotchas

There are a few drawbacks to using Crosswalk, as listed below.

#### 1. Minimum SDK level
Crosswalk is not available for Android 2.3 or 3.x, so you need to set the **Minimum SDK level** to 14 or higher in the [Android Build Settings][android-build-settings] page.


#### 2. Build Size
Crosswalk adds 22 MB to the APK file size. In comparison, the APK size without Crosswalk is around 1 MB.


#### 3. Viewport must be defined for page not to appear zoomed out
Crosswalk has currently an issue that WebViews will appear zoomed out unless the Viewport size is defined. See [issue](https://github.com/AppGyver/steroids/issues/297) for workaround and possible side-effects.

</section>

[android-build-settings]: /tooling/build-service/build-settings/build-settings-for-android/
[android-feature-table]: /tooling/wrapper/android/android-feature-table
[blog-post]: http://blog.appgyver.com/heartbeat/steroids/android-chromium/
[debugging-guide]: /tooling/cli/debugging/debugging-on-android/