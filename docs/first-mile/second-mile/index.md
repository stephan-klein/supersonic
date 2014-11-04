---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn the basics of modifying your app structure and logic
section_id: second-mile
subsections:
  - name: Overview
  - name: Basic Debugging
  - name: Model-View-Controller architecture
  - name: Generating a new module
  - name: App configuration
  - name: App logic in the controller
  - name: Access device hardware
---
<section class="docs-section" id="overview">
## Overview

In the previous section you created some simple functionality for your app just by using Supersonic web components. In this section you will:

 - Learn to do some simple debugging
 - Create some simple logic for your app
 - Learn to access the device hardware, namely the camera
 - Learn about what goes on behind the scenes in your app
 - How to access and change that information.

Let's get going!
</section>

<section class="docs-section" id="basic-debugging">
## Basic Debugging

Before adding any real logic, it is important to know how to debug your project. You are bound to make some mistakes when you develop, so learning how to detect them is key to a good development experience. Since we're working with a nearly empty app which has no errors, we'll have to cheat a little here. Let's make another change to `app/common/views/getting-started.html`. Add the following to the end of the file:

```html
<script>
  throw new Error("Oh no, there's a bug in my app!")
</script>
```

Then, let your app refresh. At first glance nothing seems to be wrong, but problems aren't always immediately visible. Just to be sure, let's take a look at some of the logs that are available to us.

### Logs in Connect Screen

You may have already noticed that the Connect Screen (the browser window from where you scan the app's QR code) contains a few different tabs, accesible from the top right corner of the window. Go to the "Logs" tab. If you've closed the window at some point, you can re-open it by typing `qr` in the Steroids console. Immediately you will notice a familiar looking message:

<img src="http://placehold.it/600x300">

It's the message from the custom Error we just created, along with some debugging information, such as the device and view the Error occurred in. You can use the tools at the top of the window to filter messages and clear the current log.

Now that we have made a note of the error, let's clear the log and try again. Remove the `<script>` tag you just inserted and save the file. After the app refreshes, take another look at the "Logs" tab and you'll see that the error no longer occurs. Congratulations, you've fixed your first bug!

Besides detecting errors, you can explicitly send logs to the Steroids Connect window with `steroids.logger.log("Your message here!")`, which can be extremely useful for tracking your application state when debugging. To read more about logging, head over to the [Logging guide](/tooling/debugging/logging/).

### Platform-specific debugging

Debugging via the Connect Screen logs is available on all devices and operating systems. For more in-depth tools (such as network monitoring, JavaScript console, DOM inspector and more), there are platform-specific solutions available. To read about them, check out the links below:

  - [Debugging on iOS](/tooling/debugging/debugging-on-ios/)
  - [Debugging on Android](/debugging/debugging-on-android)
  - [Debugging Best Practices](/tooling/debugging/best-practices/)
</section>

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

<section class="docs-section" id="generating-a-new-module">
## Generating a new module

Currently, our project only has a `common` module. We want to add a new feature to our app, so it makes sense to separate it from the `common` module. You can create a new module by running `steroids generate module <module-name>` in your project folder. Let's create a `camera` module. You will see that the following module is created for your project:

```bash
app/camera
├── index.coffee
├── scripts
│   └── IndexController.coffee
└── views
    └── index.html
```

In the module, the basic view and controller are created for you, as well as the `index.coffee` file, which declares the associated Angular module and its dependencies, which in this case is the `common` module.

### Building views from view partials

Unlike `common`, your newly generated module has no `layout.html` file. Instead, the only HTML file, `index.html` looks like the following:

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

<section class="docs-section" id="app-configuration">
## App configuration

Next, you need to attach the new module to the rest of your app's views. Let's replace the second tab with our new module. Steroids projects have a special `config/` folder where we can define certain presets for our application, including the tabs that will be used. In `config/` there are two files with differing responsibilities:

 - `app.coffee` contains general behaviour settings for your app. For further info on the settings therein, see the [app.coffee guide]().
 - `structure.coffee` is used to define the initial configuration of your app's views. For further info on the settings therein, see the [structure.coffee guide]().

For now, all you need is the `structure.coffee` file. In the file, you will see that a `tabs` property has been set, containing two views, `Index` and `Settings`. Change the tabs property to the following:

```coffee
tabs: [
  {
    title: "Index"
    id: "index"
    location: "common#getting-started"
  }
  {
    title: "Camera"
    id: "camera"
    location: "camera#index"
  }
]
```

The key change is, the second tab now points to our new `camera` module. After the app refreshes on your device, you can check out the second tab to see that it has indeed updated.

</section>
<section class="docs-section" id="app-logic-in-the-controller">
## App logic in the controller

With the new module in place, we can add some logic to it. In the MVC-pattern, the app logic is placed in a controller. When we generated our new module, an `IndexController.coffee` file was generated for us. It is empty by default, let's add a simple function to the Conroller (under the "#Controller functionality here" comment). Be aware that CoffeeScript is finicky about indentation, so you have to be careful to indent properly.

```coffee
angular
  .module('camera')
  .controller 'IndexController', ($scope, supersonic) ->
    # Controller functionality here
    $scope.takePicture = () ->
      alert "Snap!"
```

`takePicture` is a simple function that is attached to the Angular `$scope`, which is a special object that acts as a link between the application views and data model. By attaching `takePicture` to `$scope`, we are able to reference it in any view that shares the same $scope as the `IndexController`.

### Access app logic from your view

Now that we have a basic function defined, we want to provide a way to trigger it. To do so, open up `app/camera/views/index.html`, and replace the `<h1>` tag with the following:

```html
<button class="button button-block button-positive" ng-click="takePicture()">Take picture</button>
```

Now we've defined a button "Take picture", and attached the previously created `takePicture` function to it via an `ng-click` handler. `ng-click` is a variation of a basic `onclick` handler in that it automatically detects and utilises the `$scope` object. This way, `ng-click` knows to look for `$scope.takePicture` instead of just `takePicture`, as a regular `onclick` handler would. Working with `$scope` might seem convoluted at first, but it will become second nature to you as you progress through the tutorials.

Having defined the button and saved the document, your app should refresh and display the new button. If you click it, the alert you defined in `IndexController` will pop up on the screen. Tying together your app views and logic is as simple as that!

</section>
<section class="docs-section" id="access-device-hardware">
## Access device hardware

As you may have guessed, the button we defined is intended to take a picture with the device camera. To achieve that, we need to access the device hardware. Supersonic provides access to a wide range of device APIs, such as geolocation, accelerometer and media APIs such as the microphone and camera. You can also find extended support via plugins, but for now the default camera API is more than enough. Change your `$scope.takePicture` to the following:

```coffeescript
$scope.takePicture = () ->
  supersonic.media.camera.takePicture()
```

Now, when you click the "Take picture" -button, the device camera is opened and you can snap a photo. There are a number of options you can pass to the `supersonic.media.camera.takePicture` method. To read more about them and other device APIs, see the [device docs](/device/).
</section>
