---
layout: guides_architecture
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: app-config-files
---
<section class="ag__docs__content">

<section class="docs-section" id="overview">

## Overview

In this section we will go through the Supersonic project config files at `config/app.coffee` and `config/structure.coffee`. These files set general app preferences and define how the what views the application is initialized with.

<p class="advanced-panel">
If you've used the legacy version of Steroids, the different settings at <code>config/application.coffee</code>, <code>config.ios.xml</code>, <code>config.android.xml</code> and <code>config.xml</code> have been baked into these two new files.
</p>

</section>

<section class="docs-section" id="app-coffee">
## app.coffee

The `config/app.coffee` file contains settings that have to do with general app preferences.

### Basic app settings
```coffeescript
app:
  name: "My Awesome App"
```

`app.name` is a required property and specifies the name of the application. This name will be used in AppGyver Cloud Services for your cloud-deployed app (the App Store/Google Play display name will be set separately when you build a distribution version of your app).

### Network settings
```coffeescript
network:
  extraResponseHeaders:
    "Access-Control-Allow-Origin": "*"
    "Access-Control-Allow-Headers": "Content-Type, X-Requested-With"
```

The `network.extraResponseHeaders` property is an object of key-value pairs that will be appended as extra headers to all HTTP responses.

This means that with the above configuration, all responses received by your app will behave as though they had the `"Access-Control-Allow-Origin": "*"` and `"Access-Control-Allow-Headers": "Content-Type, X-Requested-With"` headers set, allowing you to circumvent CORS issues.

### WebView settings
```coffeescript
webView:
  viewsIgnoreStatusBar: false
  enableDoubleTapToFocus: false
  disableOverscroll: false
  enableViewportScale: false
  enablePopGestureRecognition: true
  allowInlineMediaPlayback: true
```

The `webView` object contains several preferences that affect how your application behaves:

* **viewsIgnoreStatusBar (boolean, defaults to false, iOS-only)** – when set to true, all WebViews start "under" the status bar by default, instead of below it.

* **enableDoubleTapToFocus (boolean, defaults to false, iOS-only)** – when set to true, double-tapping on the WebView causes the view to scroll to that position. Enabling this property adds a 300ms delay to all `click` events.

* **disableOverscroll (boolean, defaults to false)** – when set to true, WebViews won't "rubber-band" back to place (on iOS) or display the "glow" (on Android) if the user scrolls past their edge. Instead, the WebView will just stay in place.

* **enableViewportScale (boolean, defaults to false, iOS-only)** – when set to true, a `<meta name="viewport">` tag affects viewport scaling. This also means that you need to set `user-scalable=no` in the `content` attribute of the meta tag to disable pinch-to-zoom. <br><br>Example:

```html
<meta name="viewport" content="user-scalable=no, initial-scale=1,
  maximum-scale=1, minimum-scale=1,  target-densitydpi=device-dpi">
```
<br>

* **enablePopGestureRecognition (boolean, defaults to true, iOS-only)** – when set to false, the swipe-to-go-back-in-navigation-stack gesture is disabled.

* **allowInlineMediaPlayback (boolean, defaults to false, iOS-only)** - when set to true, inline HTML5 video playback is allowed on iPhone (HTML5 videos are normally opened in a native video dialogue). Note that `<video>` elements in the HTML document must also include the `webkit-playsinline="true"` attribute. On iPad, this preference is ignored and all HTML5 video files are always played inline. (Inline audio playback works on both devices regardless of this preference.)


### Steroids Add-ons settings

In Supersonic apps, the configurations for Steroids Add-ons are set in `config/app.coffee`, as follows:

```coffeescript
addons:
  facebook:
    enabled: true
  geolocation:
    continuousUpdates: true
  oauthio:
    publicKey: "0U_qd69V3rShNGlNf6g70mrw"
  urbanairship:
    enabled: true
```

</section>

<section class="docs-section" id="structure-coffee">

## structure.coffee

The `config/structure.coffee` file defines which views your application loads with. All `location` properties can be either a [Supersonic routes](/supersonic/guides/navigation/) or URLs.

### Root View
```coffeescript
rootView:
  location: "example#getting-started"
```

If you are not using tabs, you will need to define a root view. The root view is the single view that will be shown when your app loads. The `location` property determines the document to load.

### Tabs
```coffeescript
tabs: [
  {
    title: "Index"
    id: "index"
    location: "example#getting-started" # Supersonic module#view type navigation
  }
  {
    title: "Settings"
    id: "settings"
    location: "example#settings"
  }
  {
    title: "Internet"
    id: "internet"
    location: "http://google.com" # URLs are supported!
  }
]
```

The `tabs` array overrides the `rootView` property, and sets up the native tab bar for your app. Each tab has a `title` text, an `id` (for use with [native CSS styles](/supersonic/guides/ui/styling-native-components)) and a `location`.

Read more in the [tab bar guide](/supersonic/guides/ui/native-components/tab-bar/).

### Preloaded Views

```coffeescript
preloads: [
  {
    id: "learn-more"
    location: "example#learn-more"
  }
  {
    id: "using-the-scanner"
    location: "example#using-the-scanner"
  }
]
```

The `preloads` array defines a set of Views that will be loaded into memory and started during app startup. If your application is less than, say, 10 views (depending on how memory-intensive your views are), it's a good idea to preload them all. If there are more views, you should use the [supersonic.ui.views.start()](/supersonic/api-reference/stable/supersonic/ui/views/start/) and [supersonic.ui.views.stop()](/supersonic/api-reference/stable/supersonic/ui/views/stop/) functions to dynamically start and stop the views during runtime as needed.

Each preloaded View is accessible via it's `id` property during app runtime, and can be stopped, started again, pushed to the layer stack or shown as a modal just like regular started Views. The `location` property determines the document shown in the view.

### Drawers

```coffeescript
drawers:
  left:
    id: "left-drawer"
    location: "example#leftDrawer"
    showOnAppLoad: false
  right:
    id: "right-drawer"
    location: "example#rightDrawer"
    showOnAppLoad: true
  options:
    animation: "swingingDoor"
```

Define drawers/side menus that will be loaded when the app starts. Drawers can be defined for the left side, right side or both.

The `id` property defines the id of the started View that is displayed in the drawer. The `location` property defines the document shown in the drawer. The `showOnAppLoad` property can only be `true` for one drawer: that drawer will be automatically displayed during app load.

The `options.animation` property is iOS-only, and determines the animation type used when opening/closing the drawer. See the [supersonic.ui.drawers.updateOptions](/supersonic/api-reference/stable/supersonic/ui/drawers/updateoptions) API docs for a list of supported animation types.

### Initial View

```coffeescript
initialView:
  id: "initialView"
  location: "example#initial-view"
```

Determines the Initial View shown before the rest of the app loads. For more information, read the [Initial View guide](/supersonic/guides/navigation/navigating-between-views/initial-view/).
</section>


</section>
