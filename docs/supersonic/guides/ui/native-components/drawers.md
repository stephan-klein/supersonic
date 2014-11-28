---
layout: docs_ui
header_title: Supersonic Native Components
header_sub_title: Learn how to utilize the native UI components provided by Supersonic to their fullest.
section_id: native-components
subsection_id: drawers
topics:
  - name: Defining drawers
  - name: Programmatic APIs
  - name: init
    method: true
  - name: close
    method: true
  - name: open
    method: true
  - name: updateOptions
    method: true
---

<section class="docs-section" id="drawers">
# Drawers

A drawer is a view container that is located off the left or right side of the app view, and can revealed either by swiping across the screen or using the Supersonic API. The most common use case for a drawer is a side-menu: it is hidden by default and can be pulled into view when it is required, for e.g. navigating to another view. The drawer view can display HTML content just like any regular view. The Supersonic drawer responds to touch gestures just like a native drawer, so the opening gesture can be reversed or canceled at any point.
</section>

<section class="docs-section" id="defining-drawers">
## Defining drawers

Drawers can be defined before app startup in the `/config/structure.coffee` file. To enable a drawer, you define a `drawers` object. The `drawers` object has three possible properties: `left` for defining the left drawer, `right` for defining the right drawer and `options` for defining shared drawer configurations, such as the animation to use when displaying drawers. Defining a left drawer would look like the following:

```coffeescript
  drawers:
    left:
      id: "leftDrawer"
      location: "example#drawer"
      showOnAppLoad: false
    options:
      animation: "swingingDoor"
```

The `left` or `right` properties define the respective drawers themselves, and contain three properties, `id`, `location` and `showOnAppLoad`. The `id` property can be used to set an id for your drawer. Because drawers are just like any other WebViews, you can use the defined id to reference your drawer view from other code.

The `location` property determines where your tab points to, and supports two kinds of syntax. In a default Supersonic app the syntax `<module-name>#<view-name>` works. In the above code example the defined drawer will render the contents of the `drawer.html` page in the `example` module. You can also use direct urls if need be:

```coffeescript
  drawers:
    left:
      id: "leftDrawer"
      location: "http://localhost/app/example/drawer.html"
      showOnAppLoad: false
```

The `showOnAppLoad` property determines whether your drawer should be visible on screen when the app starts. This can be used e.g. to create a fixed side-menu for your app.
</section>

<section class="docs-section" id="programmatic-apis">
## Programmatic APIs

Supersonic provides API access to drawers at app runtime, so you can programmatically [create](#init), [open](#open) and [close](#close) drawers, as well as [updating or replacing](#updateOptions) them entirely.
</section>
<hr>
<section class="docs-section" id="init">
{% assign method = site.data.supersonic.ui.drawers.init %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="close">
{% assign method = site.data.supersonic.ui.drawers.close %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="open">
{% assign method = site.data.supersonic.ui.drawers.open %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="updateOptions">
{% assign method = site.data.supersonic.ui.drawers.updateOptions %}
{% include api_method.md method=method %}
</section>