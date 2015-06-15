---
layout: docs_ui
header_title: Navigation bar styling example
header_sub_title: Learn how to style the native navigation bar with CSS.
section_id: styling-native-components
subsection_id: navigation-bar-styling-example
topics:
  - name: Creating buttons
  - name: Styling icon buttons
  - name: Styling the rest
---
<section class="docs-section active" id="getting-started">

## Navigation bar styling example

One of the most common app development scenarios is adding some interactive elements to your navigation bar. In it's current state, working with the navigation bar comes with a few gotchas. Namely, if you want to apply style ids or classes to your navigation bar elements, you can not use the `<super-nav-bar>` element. Instead, you should use the `supersonic.ui.navigationBar` API from your view's JavaScript side. This guide will step through the basic steps of setting up a working navigation bar with icon and text buttons.
</section>

<section class="docs-section" id="creating-buttons">
## Creating buttons

At present, you can create two kinds of navigation bar buttons: icon buttons and text buttons. Notice that the `title` property should be omitted entirely for icon buttons.
<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
menuBtn = new supersonic.ui.NavigationBarButton({
  title: 'menu'
  onTap: function() {
    navigator.notification.alert('To the menu!')
  },
  styleId: "nav-menu"
})

searchBtn = new supersonic.ui.NavigationBarButton({
  onTap: function() {
    navigator.notification.alert('Searching!')
  },
  styleId: "nav-search"
})
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
menuBtn = new supersonic.ui.NavigationBarButton
  title: 'menu'
  onTap: () ->
    navigator.notification.alert 'To the menu!'
  styleId: "nav-menu"

searchBtn = new supersonic.ui.NavigationBarButton
  onTap: () ->
    navigator.notification.alert 'Searching!'
  styleId: "nav-search"
{% endhighlight %}
</div>

Next, let's attach the buttons to the navigation bar and display the result

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
supersonic.ui.navigationBar.update({
  title: "MyNav",
  overrideBackButton: false,
  buttons: {
    left: [menuBtn],
    right: [searchBtn]
  }
}).then(supersonic.ui.navigationBar.show())
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
supersonic.ui.navigationBar.update
  title: "MyNav"
  overrideBackButton: false
  buttons:
    left: [menuBtn]
    right: [searchBtn]

.then supersonic.ui.navigationBar.show()
{% endhighlight %}
</div>

As you can see, the left side button is rendered properly, but nothing appears on the right side where our search button should be. Next, we'll set the icon for the search button.

<div class="clearfix">
<img src="/img/guides/native-css/nav-bar-ios-step1.png" style="display:block; margin:auto;" alt="" />
</div>

</section>

<section class="docs-section" id="styling-icon-buttons">
## Styling icon buttons

The navigation bar and its elements are styled with native CSS (found in the `app/common/native-styles` folder in a default Supersonic project). There are a few platform-specific differences in how native CSS works, which is why there are separate files for the Android and iOS versions of your app.

### android.css

Android icon buttons are defined by setting the `background-image` property of the button element. Unlike in iOS, coloring SVG icons requires you to set the color of the icon in the SVG itself, the CSS styling has no effect on it. There is no other styling available for the icon buttons. For an optimal outcome, Android icons should be 24x24 pixels.

    #nav-search {
      background-image: url(icons/search.svg);
    }


### ios.css

On iOS, creating an icon button is done by setting a `background-image` property via the `icon` selector of a button element. When using a SVG icon, the icon color is controlled via the `navigation-bar` selector. There is currently effectively no way to adjust the position or size of the icon, but the default positioning has been chosen to provide sensible results.

    #nav-search icon {
      background-image: url(icons/search.svg);
    }

    navigation-bar {
      color: #ACB0B1; /* this will be inherited by the child elements */
    }

<div class="clearfix">
<img src="/img/guides/native-css/nav-bar-ios-step2.png" style="display:block; margin:auto;" alt="" />
</div>

</section>

<section class="docs-section" id="styling-the-rest">
## Styling the rest

When styling text buttons, you will most often be concerned with adjusting the font size, weight and color. For consistent results, it is recommended you use the `navigation-bar button` selector, or even the parent `navigation-bar` selector. For demonstration purposes, let's choose a four-color palette to work with. The icon button has already been styled, so we can concentrate on the text elements. We'll also want to give the text button a different color than the icon button. First, let's set the background color of the navigation bar.

```css
navigation-bar {
  background-color: #1E4E62;
}
```

Next, the title should stand out a bit

```css
navigation-bar title {
  color: #04B3FF;
  font-size: 18px;
  font-weight: 600;
}
```

Finally, let's give the menu button a style of its own

```css
navigation-bar button {
  font-size: 16px;
  font-weight: 450;
  color: #007CB1;
}
```

Note that while the font-size and font-weight for your text button is adjustable, using values that are too big might result in your button text being replaced with an ellipsis (`...`). If this happens, use smaller values in your CSS. The finished product should look something like this:

<div class="clearfix">
<img src="/img/guides/native-css/nav-bar-ios.png" style="display:block; margin:auto;" alt="" />
</div>

</section>

