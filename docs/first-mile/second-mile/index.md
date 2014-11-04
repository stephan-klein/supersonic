---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn the basics of modifying your app structure and logic
section_id: second-mile
subsections:
  - name: Overview
  - name: Styling your app
  - name: Basic Debugging
  - name: Supersonic modules
  - name: App configuration
  - name: App logic in the controller
  - name: Access device hardware
  - name: Allergic to modules and CoffeeScript?
---
<section class="docs-section" id="overview">
## Overview

In the previous section you created some simple functionality for your app just by using Supersonic web components. In this section you will:

 - Learn how to style your app
 - Learn to do some simple debugging
 - Create some simple logic for your app
 - Learn to access the device hardware, namely the camera
 - Learn about what goes on behind the scenes in your app
 - How to access and change that information.

Let's get going!

</section>
<section class="docs-section" id="styling-your-app">

# Styling your app

While the `<body>` content of your views can be styled with regular CSS just like any HTML content, the native UI elements such as the navigation and tab bars can be styled with a special CSS file, which is platform-specific. The files are located in the `app/common/native-styles/` folder. Open up the file name corresponding to the platform you are currently running the app on and find the `navigation-bar` selector. Change the contents to the following:

```css
navigation-bar {
  background-color: #27ae60;
}
```

After saving the document, your navigation bar will update to a nice green color. If you explore the CSS file further, you'll notice some basic selectors have already been laid out for you, feel free to play around with the values and see how they affect the app. For a more in-depth look at native styling, see the [native styles documentation](/native-styles).

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

You may have already noticed that the Connect Screen (the browser window from where you scan the app's QR code) contains a few different tabs, accesible from the top right corner of the window. Go to the "Logs" tab. If you've closed the window at some point, you can re-open it by typing `c` in the Steroids console. Immediately you will notice a familiar looking message:

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
<section class="docs-section" id="supersonic-modules">

## Supersonic modules

By default, Supersonic apps are made up of modules, which contain the HTML and script files for a certain portion of your app functionality. Currently, our project only has a `common` module, which is a sort of shared space for all of our app content. We want to add a new feature to our app, so it makes sense to separate it from the `common` module. You can create a new module by running `steroids generate module <module-name>` in your project folder. Let's create a `camera` module. You will see that the following module is created for your project:

```bash
app/camera
├── index.coffee
├── scripts
│   └── IndexController.coffee
└── views
    └── index.html
```

In the module, the basic view and controller are created for you, as well as the `index.coffee` file, which declares the associated Angular module and its dependencies, which in this case is the `common` module.

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

With the new module in place, we can add some logic to it. When we generated our new module, an `IndexController.coffee` file was generated for us. It is empty by default, but let's add a simple function to the Conroller (under the "#Controller functionality here" comment). Be aware that CoffeeScript is finicky about indentation, so you have to be careful to indent properly.

```coffee
angular
  .module('camera')
  .controller 'IndexController', ($scope, supersonic) ->
    # Controller functionality here
    $scope.takePicture = () ->
      alert "Snap!"
```

`takePicture` is a simple function that is attached to the Angular `$scope`, which is a special object that acts as a link between the application views and data. By attaching `takePicture` to `$scope`, we are able to reference it in any view that shares the same `$scope` as the `IndexController`.

### Access app logic from your view

Now that we have a basic function defined, we want to provide a way to trigger it. To do so, open up `app/camera/views/index.html`, and replace the `<h1>` tag with the following:

```html
<button class="button button-block button-positive" ng-click="takePicture()">Take picture</button>
```

This creates a button and attaches the previously created `takePicture` function to it via an `ng-click` handler. `ng-click` is a variation of a basic `onclick` handler that automatically detects and utilises the `$scope` object. Having defined the button and saved the document, your app should refresh and display the new button. If you click it, the alert you defined in `IndexController` will pop up on the screen. Tying together your app views and logic is as simple as that!

</section>
<section class="docs-section" id="access-device-hardware">
## Access device hardware

To actually take a picture, we need to access the device hardware. Supersonic provides access to a wide range of device APIs such as geolocation and accelerometer, and media APIs such as the microphone and camera. You can also find extended support via plugins, but for now the default camera API is more than enough. Change your `$scope.takePicture` to the following:

```coffeescript
$scope.takePicture = () ->
  supersonic.media.camera.takePicture()
```

Now, when you click the "Take picture" -button, the device camera is opened and you can snap a photo. Because we will most likely want to work with the photo after we take it, let's modify the `takePicture` method a little further by adding:

```coffeescript
$scope.imageSrc = undefined

$scope.takePicture = () ->
  supersonic.media.camera.takePicture(
    options:
      userFilesPath: "myPhoto.jpg"
  )
  .then( (imageSrc) ->
    $scope.imageSrc = imageSrc
    $scope.apply()
  )
```

Now, also add the following to the `app/camera/views/index.html`, under the previously defined `<button>` element:

```html
<img ng-show="imageSrc" ng-src="{% raw %}{{imageSrc}}{% endraw %}" alt="pic here" />
```

Save both files and you'll see that after you take a picture, it is displayed in the camera view. To read more about them and other device APIs, see the [device docs](/device/).
</section>

<section class="docs-section" id="allergic-to-modules-and-coffeescript">
##Allergic to modules and CoffeeScript?

We strive to make the development experience as smooth as possible and through our collective experience have landed on a set of what in our minds is best development practices. This includes the use of CoffeeScript and Angular. Of course you may not agree with us, in which case you are free to utilise any framework you want.

To work outside the modular app structure, you can place any assets in the `app/common/assets/` folder. The files in that folder will be copied to the application and accessible via their path relative to the `assets` folder (so e.g. `app/common/assets/views/hello.html` would be `views/hello.html` when accessed within your app).

To work with plain JavaScript, you can just create your files in the `assets` folder as described above, or embed it straight into the CoffeeScript files by surrounding your JavaScript with backticks ( \` ):

```coffeescript
  dolan = `function() {
    alert("Hey dolan!")
  }`
```
</section>
