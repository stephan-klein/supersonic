---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn the basics of modifying your app structure and logic
section_id: mile-overflow
subsections:
  - name: Model-View-Controller architecture
  - name: Building views from partials
---

## NOTE

This content is currently stuff that is overflowing from the first-mile track, and should be reviewed and placed somewhere else if deemed useful


<section class="docs-section" id="model-view-controller-architecture">
## Model-View-Controller architecture

As a final preparation step, let's take a look at the basic structure for a Supersonic app. Supersonic apps follow a model-view-controller pattern by default. The `app/` folder houses your project's content files separated into modules.

### Model
The model of a module manages the data objects of that module. This means a model has no direct influence on the application's UI or logic, but it can be observed by the other components in the module, which will then handle any updates in the application data. In Supersonic projects, the model will usually be provided by Supersonic Data (and/or the Angular `$scope` object), so don't worry about fully grasping the concept at this stage.

### View
The view is the outward-facing side of the application and the interface through which users can interact with the app. A view will generally handle gathering input from a user and displaying the results of the input.

### Controller
The controller is the glue between the view and model, and contains the bulk of the app logic. It is responsible for updating a view when the model changes, as well as updating the model based on user input.

### Basic module
A module can contain several instances of the above file types, but generally it is useful to split your app into modules based on self-contained features. This will promote code readability (and reusability in future projects). Below is the basic structure of a Supersonic module as represented by the `common` module:

```bash
.
└── common
    ├── assets
    ├── native-styles
    ├── stylesheets
    ├── views
    ├── scripts (controllers)
    └── (model)
```

The `common` module is the basis for all Supersonic apps. As the name suggests, it is used to house assets that are shared by the entire app (in the default project, it also houses the views). You can find things such as:

 - `common/views/layout.html`, which is the layout file applied "around" all views

>Note: If you wish to learn more about the MVC pattern and why you should use it, start by taking a look at the [Google primer](https://developer.chrome.com/apps/app_frameworks) on the subject.

</section>
<section class="docs-section" id="building-views-from-partials">
### Building views from view partials

Unlike `common`, a newly generated module has no `layout.html` file. Instead, the only HTML file, `index.html` looks like the following:

```html
<div ng-controller="IndexController">

  <super-navbar>
    <super-navbar-title>
      Index
    </super-navbar-title>
  </super-navbar>

  <div class="padding">
    <h1>Pow! Here's your fresh module!</h1>
  </div>

</div>
```
There is no `<html>`, `<head>` or `<body>` tag declared in the file, just a `<div>` with some content. This is known as a view partial. To make it a valid HTML document (and above all a functioning Supersonic view), we need to attach it to a special layout file, which contains all of the missing declarations. When compiling your app, the Steroids CLI looks for a `layout.html` file in the module and attaches all view partials to that layout. Since the new module does not contain one, you could create a `layout.html` and specify the scripts and stylesheets that should be paired with this view partial, but there is an easier way. The `common` module already contains a layout file (located at `app/common/views/layout.html`), which has all the basic dependecies of your project declared, such as `supersonic.js`, `steroids.js` and `cordova.js`. Because we declared `common` as a dependency to this module, the Steroids CLI will also scan that module for layouts and use the one it finds to template your views in the camera module as well.
</section>