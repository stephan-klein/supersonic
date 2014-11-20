{% assign method = include.method %}
## API Reference: {{method.namespace}}.{{method.name}}()

{{method.description}}







{% if method.exampleCoffeeScript || method.exampleJavaScript %}

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-primary active">CoffeeScript</button>
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-default">JavaScript</button>
  </div>
  <h3>Example usage</h3>
</div>

<div data-role="example-code" data-type="coffee">

{% if method.exampleCoffeeScript %}
{% highlight coffeescript %}
{{method.exampleCoffeeScript}}
{% endhighlight %}
{% endif %}

{% if !method.exampleCoffeeScript && method.usageCoffeeScript %}
{% highlight coffeescript %}
{{method.usageCoffeeScript}}
{% endhighlight %}
{% endif %}

</div>
<div data-role="example-code" data-type="js" style="display: none;">

{% if method.exampleJavaScript %}
{% highlight javascript %}
{{method.exampleJavaScript}}
{% endhighlight %}
{% endif %}

{% if !method.exampleJavaScript && method.usageJavaScript %}
{% highlight javascript %}
{{method.usageJavaScript}}
{% endhighlight %}
{% endif %}

</div>

{% endif %}





{% if method.params.size > 0 %}
### Parameters
{% if method.type %}
{% highlight coffeescript %}
{{method.type}}
{% endhighlight %}
{% endif %}
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


{% if method.returnsDescription %}
#### Returns
{{ method.returnsDescription | markdownify }}

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
      <td>{{return.description | markdownify}}</td>
    </tr>
    {% for property in return.properties %}
      <tr>
        <td class="property">{{property.name}}</td>
        <td class="highlight">
          <code class="language-coffeescript" data-lang="coffeescript">
          {{property.type | xml_escape}}
          </code>
        </td>
        <td>{{property.description | markdownify}}</td>
      </tr>
    {% endfor %}
  {% endfor %}
</table>
{% endif %}
{% endif %}

<br><br>
