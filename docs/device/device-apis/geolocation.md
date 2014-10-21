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

{% assign methods = site.data.supersonic.device.geolocation %}

<section class="docs-section" id="{{page.subsection_id}}">

# {{page.header_title}}

{% include api_bentry.md methods=methods %}

</section>
