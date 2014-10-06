---
layout: "docs_api"
version: <%= module.version %>
versionHref: <%= module.versionHref %>
section_id: api

title: <%= module.name %>
header_sub_title: ""
---

{% assign methods = site.data.<%= module.path %> %}

{% for method in methods %}

{% if method.overview %}
# {{method.name}}

{{method.description}}

{% else %}

## {{method.name}}{% if method.function %}(){% endif %}

{{method.description}}

{% if method.usageCoffeeScript || method.usageJavaScript %}
### Usage
```coffeescript
{{method.usageCoffeeScript}}
```
{% endif %}

{% if method.type %}
### Type Signature
```coffeescript
{{method.type}}
```
{% endif %}

{% if method.typedefs.size > 0 %}
### Custom Type Definitions
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Type</th>
      <th>Definition</th>
    </tr>
  </thead>
  <tbody>
  {% for typedef in method.typedefs %}
  <tr>
  <td>
  {{typedef.name}}
  </td>
  <td class="highlight">
  <code class="language-coffeescript" data-lang="coffeescript">
  {{typedef.description}}
  </code>
  </td>
  </tr>
  {% endfor %}
</table>
{% endif %}

{% if method.params.size > 0 %}
### Params
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Param</th>
      <th>Default value</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for param in method.params %}
  <tr>
  <td>
  {{param.name}}
  </td>
  <td class="highlight">
  <code class="language-coffeescript" data-lang="coffeescript">
  {{param.defaultValue}}
  </code>
  </td>
  <td>
  {{param.description}}
  </td>
  </tr>
  {% endfor %}
</table>
{% endif %}

{% if method.returns %}
### Returns
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Returns</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  <tr>
  <td>
  {{method.returns.type}}
  </td>
  <td>
  {{method.returns.description}}
  </td>
  </tr>
</table>
{% endif %}

{% endif %}
{% endfor %}
