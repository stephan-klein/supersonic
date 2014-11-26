---
layout: guides_navigation
header_title: Layer Stack
header_sub_title: Learn how the layer stack is used.
section_id: navigating-between-views
subsection_id: layer-stack
---
<section class="docs-section" id="layer-stack">
# Layer Stack

In Multi-Page applications when you navigate to a new view, the previous view is not destroyed or changed, the new view is just pushed on top of it, creating a layer stack. Only the topmost layer is visible to the user, but all previous layers exist underneath it. Conversely, navigating back from a view doesn't create a new layer in the stack, it just pops the topmost one, revealing the layer the initial navigation was triggered from.

In a tabbed application, each tab maintains it's own layer stack. You can manipulate the layer stack individually for each tab. There are also special methods for pushing a modal view into the stack.

</section>
## Programmatic APIs

<section class="docs-section" id="push">
{% assign method = site.data.supersonic.ui.layers.push %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="pop">
{% assign method = site.data.supersonic.ui.layers.pop %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="popAll">
{% assign method = site.data.supersonic.ui.layers.popAll %}
{% include api_method.md method=method %}
</section>