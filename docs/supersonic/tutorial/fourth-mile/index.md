---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn the basics of modifying your app structure and logic
section_id: fourth-mile
subsections:
  - name: Overview
  - name: Basic project structure
  - name: Model-View-Controller architecture
  - name: Angular and Supersonic
  - name: Utilising the common module
  - name: Building views from partials
---

<section class="docs-section" id="overview">
## Overview

In this section we will take a closer look at how your application is structured. You will learn:

- The basic layout of a Supersonic project
- How to use template layouts for your HTML content
- How to use the `common` module as the basis for all your Supersonic projects
- How the Steroids² CLI builds your project

You will also be introduced to some rather large concepts, such as Model-View-Controller Architecture. While we will step through the very basics of these concepts, it is recommended you go through the third-party content we link to properly familiarise yourself with them.
</section>

<section class="docs-section" id="basic-project-structure">
## Basic project structure

A default Supersonic project has the following directory structure:

```bash
.
├── app
├── bower_components
├── config
├── dist
├── logs
└── node_modules
```

Generally, you will only be interested in the `/app` and `/config` folders.

 - `/app` contains all of the application content as created by you. This means all HTML, CSS and script files will be in the `/app` folder.
 - `/config` has special files for configuring your app behaviour. This includes defining the initial views and tab structure of your app, as well as configuration for default behaviour such as enabling and disabling overscroll for all of your app's views.

The rest of the folders contain third-party dependencies required by Supersonic and various other things. The `/dist` folder doesn't exist in completely new project, it is only created once your app is compiled. The contents of `/dist` is created from the contents of `/app`, with certain structural differences.
</section>

<section class="docs-section" id="model-view-controller-architecture">
## Model-View-Controller architecture

Supersonic apps follow a model-view-controller (or MVC) pattern by default. This means that the UI (__V__iew), app logic (__C__ontroller) and data model (__M__odel) are kept separate from each other, with each one having their own area of responsibility in making your application functional. Using the MVC pattern promotes code readability and reuse, leading to better and less error prone code. The basic responsibilites of the different MVC components is listed below.

### Model

The model of a module manages the data objects of that module. This means a model has no direct influence on the application's UI or logic, but it can be observed by the other components in the module, which will then handle any updates in the application data. In Supersonic projects, the model will usually be provided by Supersonic Data (and/or the Angular `$scope` object).

### View

The view is the outward-facing side of the application and the interface through which users can interact with the app. A view will generally handle gathering input from a user and displaying the results of the input.

### Controller

The controller is the glue between the view and model, and contains the bulk of the app logic. It is responsible for updating a view when the model changes, as well as updating the model based on user input.

>Note: While the above is probably enough to know for getting through these tutorials, it is recommended you take the time to learn more about the MVC pattern and why you should use it by reading the [Google primer](https://developer.chrome.com/apps/app_frameworks) on the subject.

### MVC in a Supersonic module
Run `steroids generate testModule` to create an empty module. The basic layout of the module will be

```bash
.
└── testModule
    ├── index.coffee
    ├── views
    └── scripts (controllers)
```

The basic module will contain placeholders for views and controllers. The file structure by itself has some special signifigance which you will learn about further down this guide, but for now we are interested in how module files handle the different MVC responsibilities. We will go over that in the section below.
</section>

<section class="docs-section" id="Angular">
## Angular and Supersonic

Supersonic utilises [AngularJS](https://angularjs.org/) to create the MVC architecture in default apps created with `steroids create`.
</section>

<section class="docs-section" id="utilising-the-common-module">
## Utilising the `common` module

The `common` module is the basis for all Supersonic apps. As the name suggests, it is used to house assets that are shared by the entire app (in the default project, it also houses the views). You can find things such as:

 - `common/views/layout.html`, which is the layout file applied "around" all views

</section>

<section class="docs-section" id="building-views-from-partials">
## Building views from view partials

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