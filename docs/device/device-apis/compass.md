---
layout: docs_device
title: Supersonic Documentation
header_title: Compass
header_sub_title: Device compass.
section_id: device-apis
subsection_id: compass
methods:
  - name: watchHeading
  - name: getHeading
---

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
