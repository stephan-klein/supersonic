---
layout: docs_device
title: Supersonic Documentation
header_title: Accelerometer
header_sub_title: Device acceleration.
section_id: sensors
subsections:
- name: Accelerometer
  methods:
    - name: watchAcceleration
    - name: getAcceleration
---

<section class="docs-section" id="accelerometer">

{% assign methods = site.data.supersonic.device.accelerometer %}
{% assign watchAcceleration = methods[1] %}
{% assign getAcceleration = methods[2] %}

# Accelerometer
{{ methods[0].description }}

<section class="docs-section" id="accelerometer-watchAcceleration">
  {% include api_method.md method=watchAcceleration %}
</section>

<section class="docs-section" id="accelerometer-getAcceleration">
  {% include api_method.md method=getAcceleration %}
</section>

</section>
