---
layout: docs_device
header_title: Accelerometer
header_sub_title: Device acceleration.
section_id: device-apis
subsection_id: accelerometer
topics:
  - name: watchAcceleration
    method: true
  - name: getAcceleration
    method: true
---

# Accelerometer

{{ site.data.supersonic.device.accelerometer.overview.description }}

<section class="docs-section" id="watchacceleration">
{% assign method = site.data.supersonic.device.accelerometer.watchAcceleration %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="getacceleration">
{% assign method = site.data.supersonic.device.accelerometer.getAcceleration %}
{% include api_method.md method=method %}
</section>
