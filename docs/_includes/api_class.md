{% assign class = include.class %}
## API Reference: {{class.namespace}}.{{class.name}}

{{class.description}}

{% if class.exampleCoffeeScript || class.exampleJavaScript %}

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-primary active">CoffeeScript</button>
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-default">JavaScript</button>
  </div>
  <h3>Example usage</h3>
</div>

<div data-role="example-code" data-type="coffee">

{% if class.exampleCoffeeScript %}
{% highlight coffeescript %}
{{class.exampleCoffeeScript}}
{% endhighlight %}
{% endif %}

{% if !class.exampleCoffeeScript && class.usageCoffeeScript %}
{% highlight coffeescript %}
{{class.usageCoffeeScript}}
{% endhighlight %}
{% endif %}

</div>
<div data-role="example-code" data-type="js" style="display: none;">

{% if class.exampleJavaScript %}
{% highlight javascript %}
{{class.exampleJavaScript}}
{% endhighlight %}
{% endif %}

{% if !class.exampleJavaScript && class.usageJavaScript %}
{% highlight javascript %}
{{class.usageJavaScript}}
{% endhighlight %}
{% endif %}

</div>

{% endif %}

{% if class.params.size > 0 %}
#### Class Properties
{% if class.type %}
{% highlight coffeescript %}
{{class.type}}
{% endhighlight %}
{% endif %}
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Name</th>
      <th>Type</th>
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
  </tbody>
</table>
{% endif %}
