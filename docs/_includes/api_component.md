{% assign component = include.component %}

## &lt;{{component.name}}&gt;

{{component.description | markdownify }}

{% if component.exampleHtml %}
### Example usage
```html
{{component.exampleHtml | escape_xml}}
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
      <th>Default</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
  {% for attribute in component.attributes %}
  <tr>
    <td class="highlight">
      <code class="language-html" data-lang="html">
        {{attribute.name}}
      </code>
    </td>
    {% if attribute.defaultValue %}
    <td class="highlight">
      <code class="language-html" data-lang="html">
      {{attribute.defaultValue}}
      </code>
    </td>
    {% endif %}
    {% if attribute.defaultValue == undefined %}
    <td>
    </td>
    {% endif %}
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
  </tbody>
</table>
{% endif %}
