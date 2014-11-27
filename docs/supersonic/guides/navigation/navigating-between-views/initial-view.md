---
layout: guides_navigation
section_id: navigating-between-views
subsection_id: initial-view
---
<section class="ag__docs__content">

<section class="docs-section" id="initial-view">
# Initial view

The Initial View is a special WebView that is shown before the rest of the app is loaded. It is useful for e.g. login and session management.

## Usage

The Initial View is defined in `config/structure.coffee`:

```js
  initialView:
    id: "initialView"
    location: "application#login"
```

## Dismissing the Initial View

When `supersonic.ui.initialView.dismiss()` is called inside the Initial View, a spinner overlay will show and the rest of the app will start loading. When the app has been loaded, the Initial View will be dismissed and the app shown. You can pass the API call a steroids.Animation object to define a custom animation for the dismissal:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var animation = supersonic.ui.animate("curlDown");
supersonic.ui.initialView.dismiss(animation);
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
animation = supersonic.ui.animate "curlDown"
supersonic.ui.initialView.dismiss animation
{% endhighlight %}
</div>

## Returning to the Initial View

After dismissing the Initial View, you can call `supersonic.ui.initialView.show()` from anywhere in your app. The Initial View will be displayed with an animation and your app's WebViews will be removed from memory, leaving you with a clean slate to re-initialize your app. Like with `supersonic.initialView.dismiss()`, you can also define a custom animation for showing the Initial View.

</section>

<section class="docs-section" id="programmatic-apis">
## Programmatic APIs
The initial view can be hidden and shown programmatically. The API reference is included below for your convenience.
</section>

<section class="docs-section" id="show">
{% assign method = site.data.supersonic.ui.initialView.show %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="dismiss">
{% assign method = site.data.supersonic.ui.initialView.dismiss %}
{% include api_method.md method=method %}
</section>

</section>
