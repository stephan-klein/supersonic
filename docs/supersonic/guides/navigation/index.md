---
layout: guides_navigation
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: navigation
---

<section class="docs-section" id="navigation">
# Supersonic navigation

This section will teach how to work with Supersonic views and the view stack.

## Navigation

Supersonic apps are Multi-Page Apps (MPA) by default. This means each view in your app is an actual separate WebView with it's own lifecycle. Utilising MPA provides several very apparent boosts over a Single-Page Application where all of your views are displayed by changing the content of a single WebView. Most notably, navigating between views can be implemented natively, meaning your app will look and feel just like a native app.

Supersonic provides two ways to define your navigation structure. You can use Supersonic Web Components in your HTML, with separate navigation elements for basic, modal and drawer views. Alternatively you can also just use the Supersonic APIs to create views and manipulate the view stack. For a full rundown on navigating in a Supersonic App, see the guides in the [navigating between views section][navigation].

### Supersonic Routes

Instead of making you type out the full URL for your HTML files, Supersonic supports routes: location strings in the format `example#index`.

The first part of the string is the name of a **module**, and the second part is the name of a **view in that module**. These are resolved into the HTML document to render by Supersonic. Thus, a route `superhero#show` will render the HTML file at `mySupersonicProject/app/superhero/views/show.html`.

To read more about the architecture of Supersonic apps, see the [App Architecture guide](/supersonic/guides/architecture/app-architecture/).

## Inter-View Communication

To effectively use the Supersonic Multi-Page App architecture, you need to be able to share data between various parts of your application. Since a MPA is split into multiple separate WebViews, the techniques used are slightly different – but still awesome.

Learn about different kind of solutions to share data between different views from [Inter-View Communication guide][communication].

</section>

[navigation]: /supersonic/guides/navigation/navigating-between-views/
[communication]: /supersonic/guides/architecture/communication/
