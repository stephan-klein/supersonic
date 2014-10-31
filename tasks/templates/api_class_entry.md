---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: <%= apiPath %>
section_id: <%= section %>
subsection_id: <%= subsection %>
---

{% assign class = <%= liquidDataPath %> %}
{% include api_class.md class=class %}

## Class Methods

<% _.each(classMethodPaths, function(methodPath) { %>
{% assign method = <%= methodPath %> %}
{% include api_method.md method=method %}
<% }); %>
