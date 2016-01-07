---
layout: steroids_build
header_title: Build types for Android
header_sub_title: Learn about the different Android build types available to you.
section_id: build-settings
subsection_id: android-build-types
parent_id: tooling
---
<section class="docs-section" id="build-types-for-android">

# Build types for Android

## Related guides

- [Android Build Configuration][android-build-config]

There are several different build types to choose from in the [AppGyver Cloud Service](https://cloud.appgyver.com/applications/). Below is a quick rundown of their general differences.

## Scanner build

A Scanner build is just a Scanner that uses any custom plugins you have defined in your build settings. Even though it is built from the cloud deploy of a specific Steroids project, it is not tied to that particular project or deploy, but can (and should) be used to demo Steroids projects via a scanned qr code, just like the official AppGyver Scanner.

## Standalone builds: Ad Hoc and Google Play

Ad Hoc and Google Play builds are standalone versions of your cloud deployed project, which can be installed on your device. Please note that Android doesn't distinguish between Google Play and Ad Hoc builds. The different build types are so that you can easily have two versions of your app installed on the same device, with different names and package identifiers.

For example, if you have published your app to Google Play or some other app store, you might want to keep a separate development version on the side via Ad Hoc build, so you don't have to overwrite your latest stable store release.

## ARM vs. x86 builds

We strongly recommend that you upload two separate APK files to the Google Play store when you’re using the Crosswalk builds.

1. Crosswalk ARM build allows your APK to be deployed on 95% of Android devices.
2. Crosswalk x86 build is required for your application to work on Intel based devices, which there are a couple (eg. Asus Memopad, Samsung Galaxy Tab 3).

You can build both builds separately and upload them under the same app in Google Play. See [their Multiple APK guide](http://developer.android.com/google/play/publishing/multiple-apks.html) for more information.

There is also a third option which will build an APK containing both ARM and x86 Crosswalk runtimes. You can use this if you do not care about your APK file size. Especially during testing we recommend this option.

Each native runtime will add ~18MB to the APK file size. So ARM only and x86 only are both ~18MB at minimum, while the APK containing both ARM+x86 is ~35MB at minimum.

## Crosswalk builds

All the Android build types described above are also available as Crosswalk builds. The Crosswalk builds use [Crosswalk](https://crosswalk-project.org/) for your app's WebView in place of the regular Android Webview.

</section>

[android-build-config]: /tooling/build-service/build-settings/build-settings-for-android
