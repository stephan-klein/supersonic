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

{% assign methods = site.data.supersonic.device.accelerometer %}

<section class="docs-section" id="{{page.subsection_id}}">

# {{page.header_title}}

{% include api_bentry.md methods=methods %}

</section>
