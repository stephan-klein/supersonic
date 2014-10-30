{% assign class = include.class %}
## API Reference: {{class.namespace}}.{{class.name}}

{{class.description}}

{% if class.type %}
### Type Signature
```coffeescript
{{class.type}}
```
{% endif %}

{% if class.params.size > 0 %}
#### Class Instance Properties
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
  {% for param in class.params %}
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
    <td>{{param.description | markdownify}}</td>
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
