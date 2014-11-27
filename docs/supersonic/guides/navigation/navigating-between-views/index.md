---
layout: guides_navigation
header_title: Supersonic Navigation
header_sub_title: Learn how Supersonic handles navigation between different views.
parent_id: supersonic
section_id: navigating-between-views
---
<section class="ag__docs__content">

<section class="docs-section" id="navigating-between-views">
# Navigation

Supersonic apps are Multi-Page Apps (MPA) by default. This means each view in your app is an actual separate WebView with it's own lifecycle. Utilising MPA provides several very apparent boosts over a Single-Page Application where all of your views are displayed by changing the content of a single WebView. Most notably, navigating between views can be implemented natively, meaning your app will look and feel just like a native app.

Supersonic provides two ways to define your navigation structure. You can use Supersonic Web Components in your HTML, e.g.

```html
<super-navigate location="example#learn-more">
  <button class="button button-block button-positive"> navigate to "example/learn-more.html"</button>
</super-navigate>
```

There are separate navigation elements for basic, modal and drawer views.

You can also just use the Supersonic APIs to create views and manipulate the view stack. To create and push a WebView into view, you would do the following:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var view = new supersonic.ui.View("bananas#show");
supersonic.ui.layers.push(view);
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
view = new supersonic.ui.View "bananas#show"
supersonic.ui.layers.push view  
{% endhighlight %}
</div>

</section>

</section>
