---
layout: guides_architecture
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: steroids-to-supersonic
---
<section class="ag__docs__content">

# Migrating from Steroids to Supersonic

Migrating your old Steroids app to Supersonic starts with creating a new Supersonic app using Steroids CLI 4.0.0 or newer and running `steroids create <project_name>`.


<section class="docs-section" id="what-you-need-to-know">

## What you need to know

In Steroids the recommended way to store files for views and their controllers was `app/views/<module_name>` and `app/controllers/<module_name>`.

In Supersonic, the architecture to use is `app/<module_name>/views` and `app/<module_name>/scripts`. You can see this structure in the `app/example` folder generated into every new project.

See the [App Architecture guides](/supersonic/guides/architecture/app-architecture/#overview) for more information about the app structure in Supersonic apps and why we recommend this kind of project structure.

If your old Steroids app logic is in the `www/` folder and structured in a way that is not compatible with the Model-View-Controller model, please have a look at our explanation on [MVC](/supersonic/guides/architecture/app-architecture/#model-view-controller-architecture) and try to rearrange your project to a MVC order. You can read more in the [Migrating the `www/` folder](#migrating-the-www-folder) section below.

Note that Supersonic still works with just a `www/` folder, if you don't want to use the `app/` structure (you will be missing out on a lot of the benefits, though).

This guide is written for a CoffeeScript project, but the same things apply to a JavaScript project.


<section class="docs-section" id="cheat-sheet">

## Cheat Sheet

If you want to check what goes where but don't want to read the whole thing, check out this cheat sheet. It is meant for apps that have their modules in `/app` folder (e.g. views and controllers aren't in the `/www` folder).

```
Steroids location => Supersonic location

* = requires edit

// modules
app/views/<module_name> => app/<module_name>/views
app/controllers/<module_name> => app/<module_name>/scripts
app/models/<module_name> => app/<module_name>/scripts
etc.

// styles
www/native-styles => app/common/native-styles
www/stylesheets => app/common/stylesheets
app/views/layouts/application.html => app/common/views/layout.html

// media assets
www/icons => app/common/assets/icons
www/images => app/common/assets/images
www/audios => app/common/assets/audios
etc.

// data
www/local.raml => config/cloud-resources.raml
config/cloud.json => config/cloud.json
config/<data_name>.yaml => config/<data_name>.yaml

// configuration
bower.json => bower.json
package.json => package.json
config/application.coffee => config/structure.coffee *
www/config.xml => config/app.coffee *
www/config.ios.xml => config/app.coffee *
www/config.android.xml => config/app.coffee *

// other
www/javascripts/application.js => app/common/javascripts/application.js (+ add script tag to app/common/views/layout.html)

```


<section class="docs-section" id="migrating-the-app-folder">

## Migrating the app/ folder

In terminal in the new Supersonic folder, run `steroids generate module <module_name>` for each of your modules in your old Steroids project. This will create the basic structure for them, which is the following:

```bash
.
app/<module_name>
├── index.coffee
├── scripts
│   └── IndexController.coffee
└── views
    └── index.html
```

You can either directly copy your files for each module from your old Steroids `/app` folder and overwrite the generated files, or copy and paste the contents of each file. Add any additional files you have in the modules to their respective places. Note that the generated module has some AngularJS controller functionality in place that you might need to modify/replace for your app.

If you have application-wide layouts in e.g. `app/views/layouts/application.html` or similar, move them to `app/common/views/layout.html`. Module-specific layouts, i.e. `app/views/layouts/car.html` go to the corresponding module's folder: `app/car/views/layout.html`.


<section class="docs-section" id="migrating-the-www-folder">

## Migrating the www/ folder

The content of the folders in the Steroids projects' `www/` folder is migrated into the `app/common` folder in the new Supersonic project. The structure in `app/common` is as follows:

```bash
.
app/common
├── assets
│   ├── icons
│   │   ├── cog.svg
│   │   ├── home.svg
│   │   └── search.svg
│   └── loading.html
├── index.coffee
├── native-styles
│   ├── android.css
│   └── ios.css
├── stylesheets
│   └── application.css
└── views
    └── layout.html
```

Copy all of your assets into the `app/common/assets` folder. If you have images or audio, please create suitable subfolders for them in the `app/common/assets` folder. References to the assets folder are done simply with e.g. `<img src="/icons/cog.svg">`, which is the same way as references are done in old Steroids projects for assets in `www/`'s subfolders. This means you do not need to change the references to these files if you have them in the same subfolders as you have them in your Steroids project.

If you are using Native Styles in your Steroids app, you may simply copy the files over the files in the `app/common/native-styles` folder. If you aren't, take a look at [how our native styling works](/supersonic/guides/ui/styling-native-components/). Styles from `application.coffee` do not work in new Supersonic projects and these will have to be migrated to native styles.

Add your application-wide CSS styling to `app/common/stylesheets/application.css`, and scripts that should be loaded on every view to `app/common/views/layout.html`.

If you have e.g. some kind of an `application.coffee` or `application.js` in your Steroids app that should be included everywhere, we recommend you add its contents to `app/common/index.coffee` (or as JavaScript to `app/common/index.js`).

All configurations that were previously made in `www/config.xml`, `www/config.ios.xml` and `www/config.android.xml` are now made in `config/app.coffee`. Change the values in the generated `config/app.coffee` to match your previous configurations, and see the [App Config Files guide](/supersonic/guides/architecture/app-config-files/) for details.


<section class="docs-section" id="migrating-the-config-folder">

## Migrating the config/ folder

`cloud.json` and all files that relate to your data can be moved directly from your old Steroids project to the Supersonic project's `config/` folder.

As the previous `application.coffee` does not exist in Supersonic anymore, you will have to move the contents of this file into its new residing places. Most of the content in `application.coffee` is configured in `structure.coffee`, as it defines the tabs, initial view, drawer etc. Any `application.coffee` styles will have to migrated to [native styles](/supersonic/guides/ui/styling-native-components/).


<section class="docs-section" id="done">

## Done!

Once you have moved your project to the new Supersonic structure, you can run your app with `steroids connect` like before (check that it works correctly!).

After your app works in the new structure you can start migrating one by one `steroids.*` calls to `supersonic.*` calls and start using our web components at your leisure. As `steroids.js` is automatically included in all Supersonic projects so you do not need to move to using `supersonic.*` right away.
