---
layout: "docs_home"
version: "page.method"
versionHref: "/first-mile"
path: "tech/app_structure"
section:
  name: "First mile"

title: "Supersonic app structure"
header_sub_title: ""
---

By now you've created, previewed and debugged your first app. It's time to take a look at how a Supersonic project looks. The basic directory tree for a fresh Supersonic project looks like the following:

```bash
.
├── app
├── bower_components
├── config
├── logs
├── node_modules
└── www
```

##app

```bash
.
└── common
    ├── assets
    ├── stylesheets
    ├── views
    └── (scripts)
```

A Supersonic project utilises a module structure. A module is essentially a folder inside the `app` folder, which contains the HTML, CSS and JavaScript files for an individual part of your app. You are free to use as many (or few modals) you like in any project.

###common

An empty project contains only the `common` module, which is a sort of template for your app's components. `common/views/` also contains the layout file for your app, `layout.html`. This file is a template that acts as the base of any other views that are created in the project. Besides importing the common stylesheets and JavaScript assets such as `cordova.js`, `steroids.js` and `supersonic.js`, the file automatically pairs your views with their respective Coffeescript files in the build phase.

Similar to `layout.html`, `common` also contains a file `index.coffee`, which defines an angular module `common` and a dependency for it: `supersonic`. As this is meant to be a shared module between all your app's assets, you can treat the `common` module as a sort of template for all your application logic.

###compiling your app files

When you run `steroids connect`, the Steroids CLI executes a number of tasks to compile your app files. For the modules in your `app` folder this means the following:

- The contents of all `assets/*` files in your modules are copied to `dist/`
- All `views/*` files exluding any `layout.html` files are paired with a layout file from their own module, or if no layout is present in the module, the `common` module. They are then copied to `dist/app/<module-name>`.
- All `scripts/*` files in a module are joined together to create one JavaScript file for the module, after which the resulting files are copied to `dist/app/`.


##bower_components

```bash
.
├── angular
├── platform
├── steroids-js
└── supersonic
```

The `bower_components` folder houses external libraries that have been installed via bower. In a fresh project this will mean just the `steroids.js`, `supersonic` and `angular` files, but the contents will grow as you add external libraries.

##config

```bash
.
└── application.coffee
```

`application.coffee` is housed under the `config` folder. The `application.coffee` file contains configuration data for your app that is evaluated at runtime, including the start location of the app, any preconfigured views such as tab bars or drawers, and various other settings. The settings are explained in detail in the [application.coffee guides](https://academy.appgyver.com/categories/9-project-configuration/contents/129-basic-app-settings-in-configapplicationcoffee).

##logs

The `logs` folder is initially empty, but as you develop your app and test it via the AppGyver Scanner or a simulator, the generated logs of application activity will be stored in this folder.

##node_modules

```bash
.
├── grunt
├── grunt-contrib-clean
├── grunt-contrib-coffee
├── grunt-contrib-concat
├── grunt-contrib-copy
├── grunt-contrib-sass
├── grunt-extend-config
└── grunt-steroids
```

`node_modules` contains the preconfigured build tasks for your project and can generally be ignored.