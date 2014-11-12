---
layout: guides_navigation
section_id: navigating-between-views
subsection_id: tabs
---
<section class="docs-section" id="tabs">
# Tabs

Supersonic offers support for the native tab bar as a way to structure your app's navigation. The tab bar can be configured in `/config/structure.coffee`

```coffee
  tabs: [
    {
      title: "Index"
      id: "index"
      location: "example#getting-started"
    }
    {
      title: "Settings"
      id: "settings"
      location: "example#settings"
    }
  ]
```

A tab object consists of the `title`, `id` and `location` properties, which are relatively straightforward. The `location` property string can be a URL pointing to your tab, or a [route][route-guide].
</section>

<section class="docs-section" id="tabs-layers">
## Tabs and the layer stack

Each tab has its own layer stack. This means that switching between tabs preserves the state of the navigation in that tab. To test this out, use the default Supersonic app (generated with `steroids create`). You'll notice that if you trigger a navigation by pressing one of the buttons in the first tab, and then trigger between the two tabs, both will keep their navigation state unchanged.

</section>

<section class="docs-section" id="styling-tabs">
## Styling tabs

For styling your tab with native CSS, see the [styling native components][styling-tab-bar] guide.

</section>

<section class="docs-section" id="programmatic-apis">
## Programmatic APIs
The tab bar JavaScript APIs can be found in the [Supersonic.js API reference][tabs-api].
</section>

[route-guide]: /supersonic/guides/navigation/route
[styling-tab-bar]: /supersonic/guides/ui/styling-native-components/tab-bar
[tabs-api]: /supersonic/api-reference/stable/supersonic/ui/tabs