---
layout: "docs_api"
version: "page.method"
versionHref: "/docs"
path: "app/openURL"

title: "openURL"
header_sub_title: ""
---

{% assign method = site.data.supersonic.app.openURL %}

[View Source]({{method.source_link}})

# {{method.name.string}}

{{method.description.string}}

{% if method.usage %}
## Usage
{{method.usage.string}}
{% endif %}

{% if method.params.size > 0 %}
## Params
{% for param in method.params %}
  <strong>{{param.name}} [<em>{{param.types}}</em>]</strong>
  <ul>
  <li>{{param.description}}</li>
  </ul>

{% endfor %}
{% endif %}

{% if method.returns %}
## Returns
<strong>{{method.returns.types}}</strong>
<ul>
<li>{{method.returns.description}}</li>
</ul>
{% endif %}