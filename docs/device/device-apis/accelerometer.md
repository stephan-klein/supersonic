---
layout: docs_device
header_title: Accelerometer
header_sub_title: Device acceleration.
section_id: device-apis
subsection_id: accelerometer
methods:
  - name: watchAcceleration
  - name: getAcceleration
---

<section class="docs-section" id="accelerometer">

# Accelerometer

{{ site.data.supersonic.device.accelerometer.overview.description }}

## API Reference

<section class="docs-section" id="watchAcceleration">
{% assign watchAcceleration = site.data.supersonic.device.accelerometer.watchAcceleration %}
{% include api_method.md method=watchAcceleration %}
</section>

<section class="docs-section" id="getAcceleration">
{% assign getAcceleration = site.data.supersonic.device.accelerometer.getAcceleration %}
{% include api_method.md method=getAcceleration %}
</section>


</section>
