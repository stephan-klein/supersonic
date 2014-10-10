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

## {{method.apiCall}}{% if method.function %}(){% endif %}

{{method.description}}

{% if method.usageCoffeeScript || method.usageJavaScript %}
### Basic usage
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

{% if method.params.size > 0 %}
#### Params
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Default value</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for param in method.params %}
  <tr>
    <td>{{param.name}}</td>
    <td class="highlight">
      <code class="language-coffeescript" data-lang="coffeescript">
      {{param.type | xml_escape}}
      </code>
    </td>
    <td class="highlight">
      <code class="language-coffeescript" data-lang="coffeescript">
      {{param.defaultValue}}
      </code>
    </td>
    <td>{{param.description}}</td>
  </tr>
    {% for property in param.properties %}
      <tr>
        <td class="property">{{property.name}}</td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.type | xml_escape}}
          </code>
        </td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.defaultValue}}
          </code>
        </td>
        <td>{{property.description | markdownify}}</td>
      </tr>
    {% endfor %}
  {% endfor %}
</table>
{% endif %}


{% if method.returnsDescription %}
#### Returns
{{ method.returnsDescription }}

{% if method.returns.size > 0 %}
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for return in method.returns %}
    <tr>
      <td>{{return.name}}</td>
      <td class="highlight">
        <code class="language-coffeescript" data-lang="coffeescript">
        {{return.type | xml_escape}}
        </code>
      </td>
      <td>{{return.description}}</td>
    </tr>
    {% for property in return.properties %}
      <tr>
        <td class="property">{{property.name}}</td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.type | xml_escape}}
          </code>
        </td>
        <td>{{property.description}}</td>
      </tr>
    {% endfor %}
  {% endfor %}
</table>
{% endif %}
{% endif %}

{% if method.exampleCoffeeScript || method.exampleJavaScript %}
### Full example
```coffeescript
{{method.exampleCoffeeScript}}
```
{% endif %}

{% endif %}
{% endfor %}
