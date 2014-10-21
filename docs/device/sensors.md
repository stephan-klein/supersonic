---
layout: docs_device
title: Supersonic Documentation
header_title: Supersonic Device Access
header_sub_title: Learn how to access native device features with Supersonic.
section_id: sensors
subsections:
- name: Overview
- name: Accelerometer
  methods:
    - name: watchAcceleration
    - name: getAcceleration
- name: Compass
  methods:
    - name: watchHeading
    - name: getHeading
- name: Geolocation
  methods:
    - name: watchPosition
    - name: getPosition
---

<section class="docs-section" id="overview">
# Overview
</section>

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

<section class="docs-section" id="compass">
{% assign methods = site.data.supersonic.device.compass %}
{% assign watchHeading = methods[1] %}
{% assign getHeading = methods[2] %}

# Compass
{{ methods[0].description }}

<section class="docs-section" id="compass-watchHeading">
  {% include api_method.md method=watchHeading %}
</section>

<section class="docs-section" id="compass-getHeading">
  {% include api_method.md method=getHeading %}
</section>

</section>

<section class="docs-section" id="geolocation">
{% assign methods = site.data.supersonic.device.compass %}
{% assign watchLocation = methods[1] %}
{% assign getLocation = methods[2] %}

# Geolocation
{{ methods[0].description }}

<section class="docs-section" id="geolocation-watchLocation">
  {% include api_method.md method=watchLocation %}
</section>

<section class="docs-section" id="geolocation-getLocation">
  {% include api_method.md method=getLocation %}
</section>

</section>
