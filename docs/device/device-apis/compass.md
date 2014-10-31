---
layout: docs_device
header_title: Compass
header_sub_title: Device compass.
section_id: device-apis
subsection_id: compass
topics:
  - name: watchHeading
    method: true
  - name: getHeading
    method: true
---
# Compass

{{ site.data.supersonic.device.compass.overview.description }}

<section class="docs-section" id="watchheading">
{% assign method = site.data.supersonic.device.compass.watchHeading %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="getheading">
{% assign method = site.data.supersonic.device.compass.getHeading %}
{% include api_method.md method=method %}
</section>

</section>
