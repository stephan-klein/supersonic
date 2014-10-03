---
layout: "docs_home"
section_id: supersonic-js

title: Supersonic.js
header_sub_title: Tap into the native layer with the Supersonic.js library
---
<section class="docs-section" id="intro">
<h3 class="title"><a href="#"">Supersonic.js JavaScript library</a></h3>

Developing HTML5-based hybrid apps should be an integrated experience. The basic functionalities – hardware access, native navigation, native UI – should be accessible in a sensible way, without a mess of interdependent native plugins and JavaScript libraries. There should be no vendor lock-in to a specific MVC framework.

That's why we made *Supersonic.js* – the only JS library you'll need:

```
<script src="/components/supersonic/supersonic.js"></script>
```

It wraps a selection of Cordova plugins for the hardware access. It gives you powerful API calls to handle your app's multi-page architecture and native navigation. It allows you to manipulate the structure and style of your native UI elements. It gives access to debug functions such as powerful logging.


#### Framework Agnostic
The core of Supersonic.js is fully framework agnostic, meaning you can use it with any of the web frontend frameworks you know and love. However, we have a particular love for AngularJS, which is why built [ngSupersonic](/supersonic/angular/) – check it out!


#### The Tech
The Supersonic.js API is a modern, slick, and highly usable. All our API calls return [promises](TODO) – except when it makes more sense to have a [stream](TODO) instead.


#### Included Dependencies
We use the best tools for the job, including:
* [Bluebird](https://github.com/petkaantonov/bluebird) for promises
* [BaconJS](https://github.com/baconjs/bacon.js/) for streams
* [Polymer's platform.js](https://github.com/Polymer/platform) for a [Web Component](TODO) shim

#### Contributing
You can find the Supersonic repository on [GitHub](https://github.com/appgyver/supersonic), with [contribution instructions available here](https://github.com/AppGyver/supersonic/blob/master/CONTRIBUTING.md).

</section>

<section class="docs-section" id="debug">
<h3 class="title"><a href="#debug">Debugging with Supersonic.js</a></h3>

Squashing bugs is frustrating. Sadly, the tools available for debugging hybrid apps are not as refined as those available for the web. Plain `console.log` and `alert()` don't always cut it.

Supersonic offers several methods that help you debug your app, as well as automate tests.

See also how the [Steroids tooling helps you with debugging your app](/steroids/).
</section>

<section class="docs-section" id="debug-logger">
<h3 class="title"><a href="#debug-logger">Logger</a></h3>
The Supersonic Logger API is a powerful way to keep track of what's happening in your app. All logs are streamed to the [Steroids Connect](TODO) screen (as well as saved locally) for easy viewing.

[View API docs for `supersonic.logger` &raquo;](/supersonic/api/core/logger/)
</section>

<section class="docs-section" id="debug-ping">
<h3 class="title"><a href="#debug-ping">Ping</a></h3>

Ping the native side and get a "Pong" in response. Really only useful for seeing that your app's JavaScript code is not broken.

[View API docs for `supersonic.debug.ping` &raquo;](/supersonic/api/core/ping/)
</section>

<section class="docs-section" id="device">
<h3 class="title"><a href="#device">Device</a></h3>

Sometimes you need to access device hardware and information. While HTML5 is making leaps and strides in giving access to things like GPS data, direct access to the native interface is still better.

The `supersonic.device` namespace gives you access to the following hardware capabilities, as well as providing you useful information about the device running your app.
</section>

## Accelerometer

## Compass

## Geolocation

## Platform

The `supersonic.device.platform` is awesome
