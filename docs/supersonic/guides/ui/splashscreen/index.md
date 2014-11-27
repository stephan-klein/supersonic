---
layout: docs_ui
header_title: Splashscreen
header_sub_title: Learn how to set up a splashscreen for your app.
section_id: splashscreen
---

<section class="docs-section" id="overview">

## Splashscreen
A splashscreen is shown when your app starts up, while the actual app views are being loaded. Currently splashscreens are defined in the [AppGyver Cloud](http://cloud.appgyver.com) Build Service, separately for each cloud-deployed application. When you build a new Ad Hoc or App Store build, the uploaded custom splashscreens will be used instead of the default AppGyver splashscreen. If you build a custom Scanner build, the custom splashscreen will be used also when loading an application by scanning a QR code.

There is currently no way to set up a custom splashscreen for a Supersonic project without using the Cloud Build Service. In the current Steroids app architecture, the splashscreens are set up when the app binary is built, and thus cannot be changed dynamically for apps loaded with the store-downloaded AppGyver Scanner.

</section>
<section class="docs-section" id="ios-splashscreens">

## iOS Splashscreens
For iOS splashscreen configuration, see the [iOS build settings guide][ios-build-guide].

</section>
<section class="docs-section" id="android-splashscreens">

## Android Splashscreens
Android supports a special 9-Patch image format, which can be used to create splashscreens that scale to various display dimensions without distorting the image. For info on creating and configuring Android splashscreens, see the [Android build settings guide][android-build-guide].

</section>
<section class="docs-section" id="programmatic-usage">

## Programmatic Usage
Splashscreens can be hidden and shown programatically with the `supersonic.app.splashscreen` API, the full reference is appended below.

</section>
<section class="docs-section" id="splashscreen-hide">

{% assign method = site.data.supersonic.app.splashscreen.hide %}
{% include api_method.md method=method %}

</section>
<section class="docs-section" id="splashscreen-show">

{% assign method = site.data.supersonic.app.splashscreen.show %}
{% include api_method.md method=method %}

</section>

[android-build-guide]: /tooling/build-service/build-settings/build-settings-for-android/
[ios-build-guide]: /tooling/build-service/build-settings/build-settings-for-ios/