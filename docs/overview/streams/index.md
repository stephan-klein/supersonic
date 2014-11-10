---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic utilizes streams
section_id: streams
---

# Streams

Most of the Supersonic API's return a promise object and the value of the APi call can then be achieved using the callback for the promise. For some of the APIs (eg. those related to geolocation, compass and accelerometer) Supersonic provides also alternative versions which return _streams_ that make it easy to track as a time series the values that the API returns.

In the following a stream of compass headings is formed (using API call `supersonic.device.compass.watchHeading`) and a callback is that is called for each value is registered to the stream:

```js
compassStream = supersonic.device.compass.watchHeading()

compassStream.onValue (heading) ->
  supersonic.logger.log(
    """
    Magnetic heading: #{heading.magneticHeading}
    True heading: #{heading.trueHeading}
    Heading accuracy: #{heading.headingAccuracy}
    Timestamp: #{heading.timestamp}
    """
  )
```

Event streams that Supersonic returns can be manipulated (e.g. filtered, combined, ...) easily using Functional Reactive programming library Bacon.js

# Learn more about streams

 - [https://github.com/baconjs/bacon.js/](https://github.com/baconjs/bacon.js/)

