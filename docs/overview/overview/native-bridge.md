---
layout: docs_overview
header_title: Supersonic Overview
header_sub_title: An overview of the Supersonic library and its inner workings.
section_id: overview
subsection-id: native-bridge
---

# Supersonic Native API Bridge

In order to communicate between the HTML5 WebViews and the native code, there needs to ben an "API bridge" that handles the communication.

The native bridge works in an async fashion. The API call is triggered and passed on to the native-side handler, which then triggers an appropriate callback. Supersonic then enhances this by wrapping the JavaScript APIs themselves in promises.

The basic functionality of the native API bridge is demonstrated with the [supersonic.debug.ping](#ping) function, which simply returns a "Pong!" string after having made a round trip to the native side.

<section class="docs-section" id="ping">
{% assign method = site.data.supersonic.core.debug.ping %}
{% include api_method.md method=method %}
</section>
