---
layout: docs_device
header_title: Geolocation
header_sub_title: Device geolocation.
section_id: device-apis
subsection_id: geolocation
topics:
  - name: watchPosition
    method: true
  - name: getPosition
    method: true
---
# Geolocation

{{ site.data.core.device.geolocation.overview.description }}

## API Reference

<section class="docs-section" id="watchposition">
{% assign method = site.data.core.device.geolocation.watchPosition %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="getposition">
{% assign method = site.data.core.device.geolocation.getPosition %}
{% include api_method.md method=method %}
</section>
