---
layout: "docs_home"
section_id: javascript
subsection_id: debug

title: Supersonic.js
header_sub_title: Tap into the native layer with the Supersonic.js library
---
# Debugging with Supersonic.js

Squashing bugs is frustrating. Sadly, the tools available for debugging hybrid apps are not as refined as those available for the web. Plain `console.log` and `alert()` don't always cut it.

Supersonic offers several methods that help you debug your app, as well as automate tests.

See also how the [Steroids tooling helps you with debugging your app](/steroids/).

## Logger
The Supersonic Logger API is a powerful way to keep track of what's happening in your app. All logs are streamed to the [Steroids Connect](TODO) screen (as well as saved locally) for easy viewing.

It's built to be compatible with [winston](http://github.com/flatiron/winston) (which is what we use in Steroids tooling to process the logs – see [here] for more techincal details.)

[View API docs for `supersonic.logger` &raquo;](/supersonic/api/core/logger/)

## Other, Less Important APIs

### Ping

Poing the native side and get a "Pong" in response. Really only useful for seeing that your app's JavaScript code is not broken.

[View API docs for `supersonic.debug.ping` &raquo;](/supersonic/api/core/ping/)