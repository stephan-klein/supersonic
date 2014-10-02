---
layout: "docs_home"
section_id: supersonic-js

title: Supersonic.js
header_sub_title: Tap into the native layer with the Supersonic.js library
---
# Supersonic.js JavaScript library

Developing HTML5-based hybrid apps should be an integrated experience. The basic functionalities – hardware access, native navigation, native UI – should be accessible in a sensible way, without a mess of interdependent native plugins and JavaScript libraries. There should be no vendor lock-in to a specific MVC framework.

That's why we made *Supersonic.js* – the only JS library you'll need:

```
<script src="/components/supersonic/supersonic.js"></script>
```

It wraps a selection of Cordova plugins for the hardware access. It gives you powerful API calls to handle your app's multi-page architecture and native navigation. It allows you to manipulate the structure and style of your native UI elements. It gives access to debug functions such as powerful logging.

## Framework Agnostic
The core of Supersonic.js is fully framework agnostic, meaning you can use it with any of the web frontend frameworks you know and love. However, we have a particular love for AngularJS, which is why built [ngSupersonic](/supersonic/angular/) – check it out!

## The Tech
The Supersonic.js API is a modern, slick, and highly usable. All our API calls return [promises](TODO) – except when it makes more sense to have a [stream](TODO) instead.

### Included Dependencies
We use the best tools for the job, including:
* [Bluebird](https://github.com/petkaantonov/bluebird) for promises
* [BaconJS](https://github.com/baconjs/bacon.js/) for streams
* [Polymer's platform.js](https://github.com/Polymer/platform) for a [Web Component](TODO) shim

## Contributing
You can find the Supersonic repository on [GitHub](https://github.com/appgyver/supersonic), with [contribution instructions available here](https://github.com/AppGyver/supersonic/blob/master/CONTRIBUTING.md).
