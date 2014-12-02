---
layout: docs_ui
header_title: Styling Supersonic navigation bar
header_sub_title: Learn how to style the native navigation bar with CSS.
section_id: styling-native-components
subsection_id: navigation-bar
topics:
  - name: navigation-bar
  - name: navigation-bar-title
  - name: navigation-bar-back-button
  - name: navigation-bar-button
---

<section class="docs-section" id="navigation-bar">
# Styling the native navigation bar

You can style the native navigation bar by modifying the files in `app/common/native-styles/`. There are separate files for iOS and Android styling. The native navigation-bar can be styled with the following selector:

```css
navigation-bar {
}

```
Please note that the style rules set to the `navigation-bar` selector also apply to the `<super-navbar>` Web Component. No `super-navbar` CSS selector is available.

To set the background color of your navigation bar, just add the `background-color` rule to the selector:

```css
navigation-bar {
  background-color: #34495e;
}
```

Note that normal CSS inheritance applies, so if you set

```css
navigation-bar {
  background-color: #34495e;
  color: #1abc9c;
}
```
All the child elements of the navigation-bar will inherit those rules, unless they have a corresponding rule of their own. In a default project, the above `color` rule will be inherited by the navigation bar buttons (changing their font color), but not the navigation bar title, because it has a `color` rule set by default.

## Child selectors
<section class="docs-section" id="navigation-bar-title">
### Styling the navigation bar title

The navigation bar title has it's own selector: `navigation-bar title`. This will affect the navigation bar title text. To change the basic title CSS, use the following:

```css
navigation-bar title {
  color: #1abc9c;
  font-size: 18px;
  font-weight: 600;
}
```
</section>

<section class="docs-section" id="navigation-bar-back-button">
### Styling the navigation bar back button

<p class="advanced-panel">
<strong>Note:</strong> styling the back button is currently not available on iOS. We are working to fix this and will be releasing an update soon.
</p>

The native back button consists of two parts: the back indicator and the back button itself. The back indicator is the small icon displayed next to the back button text. It can be referenced with the `back-indicator` selector:

```css
navigation-bar back-indicator {
  background-image: url(icons/cog.svg)
}
```

To style the back button text, you can use the `navigation-bar` parent selector, or use the following selector:

```css
navigation-bar back-button {
  font-family: serif;
  font-size: 14px;
}
```

**On Android only**, there is also the `back-button:pressed` pseudo selector, used to set the e.g. color of the back button when it's tapped.

```css
navigation-bar back-button:pressed {
  color: #fff;
}
```
</section>

<section class="docs-section" id="navigation-bar-button">
### Styling the navigation bar buttons

Navigation bar buttons (apart from the [back button](#navigation-bar-back-button)) can be styled with the `navigation-bar button` selector:

```css
navigation-bar button {
  background-color: #16a085
  color: #34495e;
  border-radius: 4px;
}
```

[nav-bar-api]: /api/pixate/navigation-bar
[nav-bar-title-api]: /api/pixate/navigation-bar-title
[nav-bar-back-button-api]: /api/pixate/navigation-bar-back-button
[nav-bar-button-api]: /api/pixate/navigation-bar-button

</section>
