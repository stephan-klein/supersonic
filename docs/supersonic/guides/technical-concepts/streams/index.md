---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic utilizes streams
section_id: streams
parent_id: supersonic
---
<section class="ag__docs__content">

<section class="docs-section" id="streams">
# Streams

Most of the Supersonic APIs return a [promise][promise-overview]  and the response of the API call can then be achieved registering a callback to the promise. For some of the APIs (eg. those related to [geolocation, compass and accelerometer][device-apis] Supersonic provides also alternative versions which return _streams_ that make it easy to track as a time series the values that the API returns.

In the following a stream of [compass headings][compass-api] is created and a callback  that is called for each value is registered to the stream:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var compassStream = supersonic.device.compass.watchHeading();

compassStream.onValue( function(heading) {
  supersonic.logger.log(
    "Magnetic heading: " + heading.magneticHeading + "\n" +
    "True heading: " + heading.trueHeading + "\n" +
    "Heading accuracy: " + heading.headingAccuracy + "\n" +
    "Timestamp: " + heading.timestamp
  );
 });
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
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
{% endhighlight %}
</div>

Event streams that Supersonic returns can be manipulated (e.g. filtered, combined, ...) easily using Functional Reactive programming library [Bacon.js](https://github.com/baconjs/bacon.js/).

# Learn more about streams

 - [Bacon JS](https://github.com/baconjs/bacon.js/)

</section>

</section>

[compass-api]: /supersonic/api-reference/stable/supersonic/device/compass/watchheading
[device-apis]: /supersonic/api-reference/stable/supersonic/device/
[promise-overview]: /supersonic/guides/technical-concepts/promises/