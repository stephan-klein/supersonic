---
layout: "docs_api"
version: "page.method"
versionHref: "/docs"
path: "notification/vibrate/"

title: "vibrate"
header_sub_title: ""
---

{% assign method = site.data.supersonic.notification.vibrate %}

[View Source]({{method.source_link}})

# {{method.name.string}}

{{method.description.string}}

## Usage
{{method.usage.string}}

## Params
{% for param in method.params %}
  <strong>{{param.name}} [<em>{{param.types}}</em>]</strong>
  <ul>
  <li>{{param.description}}</li>
  </ul>

{% endfor %}

## Returns
<strong>{{method.returns.types}}</strong>
<ul>
<li>{{method.returns.description}}</li>
</ul>