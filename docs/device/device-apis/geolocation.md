---
layout: docs_device
title: Supersonic Documentation
header_title: Geolocation
header_sub_title: Device geolocation.
section_id: device-apis
subsection_id: geolocation
methods:
  - name: watchLocation
  - name: getLocation
---

<section class="docs-section" id="geolocation">
{% assign methods = site.data.supersonic.device.geolocation %}
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
