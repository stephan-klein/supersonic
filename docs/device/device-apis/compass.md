---
layout: docs_device
header_title: Compass
header_sub_title: Device compass.
section_id: device-apis
subsection_id: compass
methods:
  - name: watchHeading
  - name: getHeading
---
<section class="docs-section" id="compass">

# Compass

{{ site.data.supersonic.device.compass.overview.description }}

## API Reference

<section class="docs-section" id="watchHeading">
{% assign watchHeading = site.data.supersonic.device.compass.watchHeading %}
{% include api_method.md method=watchHeading %}
</section>

<section class="docs-section" id="getHeading">
{% assign getHeading = site.data.supersonic.device.compass.getHeading %}
{% include api_method.md method=getHeading %}
</section>

</section>
