---
layout: docs_device
header_title: Geolocation
header_sub_title: Device geolocation.
section_id: device-apis
subsection_id: geolocation
methods:
  - name: watchPosition
  - name: getPosition
---

<section class="docs-section" id="geolocation">

# Geolocation

{{ site.data.supersonic.device.geolocation.overview.description }}

## API Reference

<section class="docs-section" id="watchPosition">
{% assign watchPosition = site.data.supersonic.device.geolocation.watchPosition %}
{% include api_method.md method=watchPosition %}
</section>

<section class="docs-section" id="getPosition">
{% assign getPosition = site.data.supersonic.device.geolocation.getPosition %}
{% include api_method.md method=getPosition %}
</section>

</section>
