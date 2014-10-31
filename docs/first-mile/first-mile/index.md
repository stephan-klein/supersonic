---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic First Mile
header_sub_title: Learn how to build your first app in 5 minutes.
section_id: first-mile
subsections:
  - name: Overview
  - name: Installation
  - name: Creating a New Project
  - name: Connecting Your Device
  - name: Making Changes
---

<section class="docs-section" id="overview">
## Overview

In this tutorial, we will be going through the few simple steps needed to get an app running on your device. This section will take 5-10 minutes to complete, and the end result will look like this:

<img src="http://placehold.it/600x300">
</section>

<section class="docs-section" id="installation">
## Installation

Before we move forward, you need to install the Steroids² tooling. Head on over to our [Install Wizard](https://academy.appgyver.com/installwizard) page and follow the instructions there.
</section>

<section class="docs-section" id="creating-a-new-project">
## Creating a New Project

With your brand-new Steroids² CLI running, head on over to your terminal app of choice and create your first app. To do so, just type:

```bash
steroids create myProject
```

The Steroids² CLI will create a basic project in the `myProject/` folder and install some required dependencies like the `steroids.js` and `supersonic.js` libraries. Feel free to poke around for a little while, but the app structure will be better explained in a later chapter.
</section>

<section class="docs-section" id="connecting-your-device">
## Connecting Your Device

Running your app is super-easy via the AppGyver Scanner. If you haven't done so yet, download the AppGyver Scanner for your Android or iOS device:

  - [AppGyver Scanner for iOS](https://itunes.apple.com/us/app/appgyver-scanner/id575076515?mt=8)
  - [AppGyver Scanner for Android](https://play.google.com/store/apps/details?id=com.appgyver.freshandroid)

Next, head back to the terminal to run your app. In your project folder (`myProject/` in this case), enter the following command:

```bash
steroids connect
```

###Connecting with an actual device

The Steroids² CLI will compile your project and then open up a new browser window with a prominently displayed QR code:

<img src="http://placehold.it/600x300">

Now, to run your app in a real device, all you have to do is open the AppGyver Scanner you downloaded previously and scan the displayed QR code. The Scanner app will then download the required files and start your app.

In this view, the most interesting bits are at the top and bottom of the screen. At the top you see a native navigation bar with a title text. At the bottom, there is a tab bar with two tabs, `index` and `settings`. Feel free to click the `settings` tab and play around with the buttons and sliders you see there.
</section>

<section class="docs-section" id="making-changes">
## 2.5 Making Changes

With your app up and running, we're ready to make some changes. Open the `myProject/app/common/views/gettin-started.html` file in your editor of choice and change the contents of the file to be:

```html
<super-navbar>
  <super-navbar-title>
    Hello World!
  </super-navbar-title>
</super-navbar>

<div class="padding">
  <super-navigate location="common#getting-started">
    <button class="button button-block button-positive">Go to getting started</button>
  </super-navigate>
</div>
```
This does two things: it changes the title of the navigation bar to "Hello World!", and it adds a `<super-navigate>` element to the actual view body. `<super-navigate>` elements can be used to control navigation in your app, with this particular element taking you to the `app/common/views/getting-started` html page. Both the navigation bar and super-navigate elements will be covered in more detail in a later chapter, so don't worry about the details of their implementation for now.

After saving the file you still need to push the changes to the test device. To do so, simply go to the terminal window running `steroids connect` and press Enter. The Scanner app will then automatically reload the app and display the new content. You will see the navigation bar has changed color, and the button we created inside `<super-navigate>` has appeared. Click the button to trigger a navigation to a new page. You will see the new view animate into view, and a back button appear on the navigation bar, which you can use to navigate back to the original view. Congratulations, you have created the first functionality for your app!
</section>

##Done

In this section we've covered the basics of app development, by now you know how to:

  - Create a Steroids app
  - Edit your app

With these skills, you have grasped the core of developing Supersonic apps! Once you're ready, dive into the Second mile to learn more essential skills, like debugging your app, as well as a deeper insight into how a Supersonic app really works.
