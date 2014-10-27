---
layout: "docs_api"
version: <%= module.version %>
versionHref: <%= module.versionHref %>
section_id: api-reference

title: API Reference
header_sub_title: ""
---

{% assign component = site.data.<%= module.path %> %}

{% include api_component.md component=component %}
