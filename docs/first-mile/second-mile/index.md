---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn the basics of modifying your app structure and logic
section_id: second-mile
subsections:
  - name: Overview
  - name: Livereload
  - name: Debugging via Connect Screen
  - name: Model-View-Controller Architecture
  - name: Generating a New Module
  - name: App Configuration
  - name: App Logic in the Controller
  - name: Access Device Hardware
---
<section class="docs-section" id="overview">
## Overview

In the previous section you created some simple functionality for your app just by using html elements. In this section you will create some simple logic for your app and learn to access the device hardware, such as the camera. Additionally, you will learn about what goes on behind the scenes in your app and how to access and change that information.
</section>

<section class="docs-section" id="livereload">
## Livereload

You may have noticed already during the first mile that, while very handy, reloading your app contents takes several seconds to complete. What you probably didn't notice though, was that many times the reload cycle was completely unnecessary. This is because of a feature called livereload, where the Steroids CLI watches your project files and pushes any updates it detects instantly to the connected devices. Livereload can only update your existing project files though and it does not reset the UI state, so if you add new files or remove native components like the `<super-navigate>` element, you will have to trigger a full reload (like in the previous section) by pressing enter in the Steroids CLI.
</section>

<section class="docs-section" id="debugging-via-connect-screen">
## Debugging via Connect Screen

Before adding any real logic, it is important to know how to debug your project. You are bound to make some mistakes when you develop, so learning how to detect them is key to a good development experience. Since we're working with a nearly empty app which has no errors, we'll have to cheat a little here. Let's make another change to `app/common/views/getting-started.html`. Add the following to the end of the file:

```html
<script>
  throw new Error("Oh no, there's a bug in my app!")
</script>
```

Then, refresh your app (or let livereload handle it). At first glance nothing seems to be wrong, but problems aren't always immediately visible. Just to be sure, let's take a look at some of the logs that are available to us.

###Connect window

You may have already noticed that the browser window from where you scan the app's QR code contains a few different tabs, accesible from the top right corner of the window. Go to the "Logs" tab. If you've closed the window at some point, you can re-open it by typing `qr` in the Steroids console. Immediately you will notice a familiar looking message:

<img src="http://placehold.it/600x300">

It's the message from the custom Error we just created, along with some debugging information, such as the device and view the Error occured in. You can use the tools at the top of the window to filter messages and clear the current log. Now that we have made a note of the error, let's clear the log and try again. In `app/common/views/index.html`, remove the `<script>` tag and it's contents and save the file. After the app refreshes take another look at the "Logs" tab and you'll see that the error no longer occurs. Gongratulations, you've fixed your first bug!

###Platform-specific debugging

Debugging via the connect screen is available on all devices. For more in-depth tools (such as network monitoring), there are platform-specific solutions available. To read about them, check out the links below.

  - [Safari Debugger]()
  - [Chrome Debugger]()
</section>

<section class="docs-section" id="model-view-controller-architecture">
## Model-View-Controller Architecture

As a final preparation step, let's take a look at the basic structure for a Supersonic app. Supersonic apps follow a model-view-controller pattern by default. The `app/` folder houses your project implementation in special modules, which contain the views and controllers associated with that module. Models will usually be supplied by Supersonic Data, so we won't go into full detail about them here. The basic structure of a Supersonic module is the following:

```bash
.
└── common
    ├── assets
    ├── stylesheets
    ├── views
    ├── (models)
    └── (controllers)
```

The `common` module is the basis for all Supersonic apps. As the name suggests, it houses views and logic that is shared by the entire app.

>Note: If you wish to learn more about the MVC pattern and why you should use it, start by taking a look at the [Google primer](https://developer.chrome.com/apps/app_frameworks) on the subject.

</section>

<section class="docs-section" id="generating-a-new-module">
## Generating a New Module

Currently, our project only has a `common` module. We want to add a new feature to our app, so it makes sense to separate it from the `common` module. You can create a new module by running `steroids generate module <module-name>` in your project folder. Let's create a `camera` module. You will see that the following module is created for your project:

```bash
app/camera
├── index.coffee
├── scripts
│   └── IndexController.coffee
└── views
    └── index.html
```

In the module, the basic view and controller are created for you, as well as the `index.coffee` file, which declares the associated Angular module and its dependencies, which in this case is the `common` module. Unlike `common`, your newly generated module has no `layout.html` file. Instead, because we declared `common` as a dependency to this module, the layout file in `common` will be used.

</section>

<section class="docs-section" id="app-configuration">
## App Configuration

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
## App Logic in the Controller

With the new module in place, we can add some logic to it. In the MVC-pattern, the app logic is placed in a Controller. When we generated our new module, an `IndexController.coffee` file was generated for us. It is empty by default, let's add a simple function to the Conroller (under the "#Controller functionality here" comment). Be aware that CoffeeScript is finicky about indentation, so you have to be careful to indent properly.

```coffee
angular
  .module('camera')
  .controller 'IndexController', ($scope, supersonic) ->
    # Controller functionality here
    $scope.takePicture = () ->
      alert "Snap!"
```

`$scope.takePicture`
</section>

