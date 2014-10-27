{% assign component = include.component %}

## &lt;{{component.name}}&gt;

{{component.description | markdownify }}

{% if component.usageHtml %}
### Basic usage
```html
{{component.usageHtml | escape_xml}}
```
{% endif %}

{% if component.syntax %}
### Component Syntax
```html
{{component.syntax | escape_xml}}
```
{% endif %}

{% if component.attributes.size > 0 %}
#### Attributes
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Default value</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for attribute in component.attributes %}
  <tr>
    <td>{{attribute.name}}</td>
    <td class="highlight">
      <code class="language-html" data-lang="html">
      {{attribute.defaultValue}}
      </code>
    </td>
    <td>{{attribute.description | markdownify}}</td>
  </tr>
    {% for child in attribute.children %}
      <tr>
        <td class="attribute-child">{{child.name}}</td>
        <td class="highlight">
          <code class="language-html" data-lang="html">
          {{child.defaultValue}}
          </code>
        </td>
        <td>{{child.description | markdownify}}</td>
      </tr>
    {% endfor %}
  {% endfor %}
</table>
{% endif %}

{% if component.exampleHtml %}
### Full example
```html
{{component.exampleHtml | escape_xml}}
```
{% endif %}
