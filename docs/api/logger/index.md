---
layout: "docs_api"
version: "page.method"
versionHref: "/docs"
path: "logger/"

title: "Logger"
header_sub_title: "Supersonic.js logging"
---

{% assign tags = site.data.supersonic.core.logger %}

{% for tag in tags %}

# {{tag.name}}

{{tag.description}}

## Usage
{{tag.usage}}

## Params
{% for param in tag.params %}
  <strong>{{param.name}} [<em>{{param.types}}</em>]</strong>
  <ul>
  <li>{{param.description}}</li>
  </ul>

{% endfor %}


{% if tag.returns %}
## Returns
<strong>{{tag.returns.types}}</strong>
<ul>
<li>{{tag.returns.description}}</li>
</ul>
{% endif %}

{% endfor %}
