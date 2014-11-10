---
layout: docs_ui
header_title: Layer Stack
header_sub_title: Learn how the layer stack is used.
section_id: navigation
subsection_id: initial-view
---

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

supersonic.ui.initialView.show()

## Returning to the Initial View

After dismissing the Initial View, you can call `supersonic.ui.initialView.show()` from anywhere in your app. The Initial View will be displayed with an animation and your app's WebViews will be removed from memory, leaving you with a clean slate to re-initialize your app. Like with `supersonic.initialView.dismiss()`, you can also define a custom animation for showing the Initial View.


## API Docs

For more see

[api-reference/stable/supersonic/ui/initialview/](api-reference/stable/supersonic/ui/initialview/)