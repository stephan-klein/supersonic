---
layout: guides_architecture
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: app-architecture
---
<section class="ag__docs__content">

<section class="docs-section" id="overview">

## Overview

In this section we will take a closer look at how your application is structured. We'll have a look on

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

The rest of the folders contain third-party dependencies required by Supersonic and various other things. The `/dist` folder doesn't exist in a completely new project, it is only created once your app is compiled. The contents of `/dist` is created from the contents of `/app`, with certain structural differences.

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
In the [third mile of Supersonic tutorials](/supersonic/tutorial/third-mile/) we created a data resource `superhero` and a matching module for it. The structure of the module looks like the following:

```bash
.
app/superhero
├── index.coffee
├── scripts
│   ├── EditController.coffee
│   ├── IndexController.coffee
│   ├── NewController.coffee
│   ├── ShowController.coffee
│   └── SuperheroModel.coffee
└── views
    ├── _form.html
    ├── _spinner.html
    ├── edit.html
    ├── index.html
    ├── layout.html
    ├── new.html
    └── show.html
```

It contains the views, controllers and model for this module. The file structure by itself has some special signifigance which you will discuss about a bit later, but for now we are interested in how module files handle the different MVC responsibilities. We will go over that in the section below.

</section>
<section class="docs-section" id="angular-and-supersonic">

## Angular and Supersonic

By default, Supersonic utilises [AngularJS](https://angularjs.org/) to create the MVC architecture in created apps. Each view in a module declares a controller that handles the logic for that view, e.g. in `/superhero/views/index.html`:

```html
<div ng-controller="IndexController">
```

The `/superhero/scripts/IndexController.js` file (or the `/superhero/scripts/IndexController.coffee` file, if using CoffeeScript) in turn declares which module the controller belongs to and what dependencies to inject into the controller itself:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
angular
  .module('superhero')
  .controller("IndexController", function($scope, Superhero) {
  });
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
angular
  .module('superhero')
  .controller "IndexController", ($scope, Superhero) ->
    
{% endhighlight %}
</div>

Note that `Superhero` dependency is injected into the controller. That is the data model we defined in the previous tutorial, and it provides this controller access to the `Superhero` object, which in turn can communicate with our database. The next step is tying it all together.

</section>
<section class="docs-section" id="building-views-from-partials">

## Building views from view partials

You may have noticed that the `/superhero/views/index.html` file isn't a complete HTML document. It just declares a `<div>` element that binds a controller to itself with the `ng-controller` attribute. This is known as a view partial. To make it a valid HTML document (and above all a functioning Supersonic view), we need to attach it to a special layout file, which contains all of the missing declarations. When compiling your app, the Steroids CLI looks for a `layout.html` file in the module and attaches all view partials to that layout.

The `/superhero/views/layout.html` file specifies the scripts and stylesheets that should be paired with this view partial. It also has some special logic for bootstrapping the Angular application that makes up the MVC structure in our app.

```html
<head>
  <!-- Rest of head tags omitted -->
  <% _.each(yield.modules, function(module) { %>
  <script src="/app/<%= module %>.js"></script>
  <% }); %>
</head>
<body ng-app="<%= yield.moduleName %>" class="content">

<%= yield.view %>
```

The `<%= ... %>` blocks are used to automatically pair each view with the corresponding controller and bootstrap an `ngApp` in that view.

</section>
<section class="docs-section" id="utilising-the-common-module">

## Utilising the common module

The `common` module also already contains a layout file (located at `app/common/views/layout.html`), which has all the basic dependecies of your project declared, such as `supersonic.js`, `steroids.js` and `cordova.js`. Because `common` is declared as a dependency to all modules by default, the layout file in there can be used to throughout the app just by removing any layout files from the module itself.

</section>