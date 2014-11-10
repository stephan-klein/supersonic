---
layout: docs_ui
title: Supersonic Documentation
header_title: Supersonic UI
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
section_id: overview
---

<section class="docs-section" id="overview">
# Supersonic UI and navigation

This section will teach you how to utilise Supersonic components in your app, as well as give you a rundown on how to work with Supersonic views and the view stack.

## UI

Supersonic provides access to a huge number of UI components, with special native implementations for some core components, such as the navigation and tab bars. All Supersonic components (even the native ones!) can be styled with CSS, but be aware that native styling is kept separate from your basic CSS. To learn more about available components, check out the guides:

  - [CSS components][css-components]
  - [Native components][native-components]
  - [Styling native components][styling-native-components]


## Navigation

Supersonic apps are Multi-Page Apps (MPA) by default. This means each view in your app is an actual separate WebView with it's own lifecycle. Utilising MPA provides several very apparent boosts over a Single-Page Application where all of your views are displayed by changing the content of a single WebView. Most notably, navigating between views can be implemented natively, meaning your app will look and feel just like a native app.

Supersonic provides two ways to define your navigation structure. You can use Supersonic Web Components in your HTML, with separate navigation elements for basic, modal and drawer views. Alternatively you can also just use the Supersonic APIs to create views and manipulate the view stack. For a full rundown on navigating in a Supersonic App, see the guides in the [navigation section][navigation].

## Views

Each Supersonic app consists of one or more views. Views can be created and destroyed on the fly, or started and then persisted, keeping them available at a moments notice. Learn about views in the [views guide][views].

## Interview communication

To effectively use the Supersonic Multi-Page App architecture, you need to be able to share data between various parts of your application. Since a MPA is split into multiple separate WebViews, the techniques used are slightly different – but still awesome.
 Learn about different kind of solutions to share data between different views from [inter view communication guide][communication].

</section>

[navigation]: /ui-and-navigation/navigation
[css-components]: /ui-and-navigation/components
[native-components]: /ui-and-navigation/native-components
[styling-native-components]: /ui-and-navigation/styling-native-components
[views]: /ui-and-navigation/views
[communication]: /ui-and-navigation/communication




