---
layout: steroids_cli
header_title: Usage with Cordova
header_sub_title: Learn how to use Steroids CLI with your Cordova projects
section_id: usage-with-cordova
parent_id: tooling
---

<section class="docs-section" id="overview">

# Using Steroids CLI with Cordova projects

Steroids CLI can be used with Cordova projects to rapidly test, develop and share them without the need for Xcode or Android Studio.

Note that not all features are available – see the [known issues](#known-issues) section below for details.
</section>
<section class="docs-section" id="starting-the-steroids-development-server">

## Starting the Steroids Development Server

To start the Steroids Development Server in a Cordova project, open your project folder in a terminal window and run

```
steroids connect
```

Steroids CLI will auto-detect that your project is a Cordova project (based on the existence of the `config.xml` file in your project root). The Steroids Development Server will start and the [Connect Screen](/tooling/cli/connect-screen) will be opened.

Note that **Steroids CLI won't modify your project files** – the `dist/` folder (which you might be familiar with from Supersonic projects) is created in the system temporary folder.
</section>
<section class="docs-section" id="connecting-with-the-appgyver-scanner-app">

## Connecting with the AppGyver Scanner app

Scan the QR code with the AppGyver Scanner app, or click on the buttons to launch an Android emulator or the iOS Simulator.

The initial page loaded is read from the `<content >` element in `config.xml` – `www/index.html` by default.

Changes to `www` folder contents are auto-detected, triggering a refresh of your app.

**Note that only the Cordova core plugins are available with the Scanner downloaded from App Store/Google Play.** To include custom plugins, you need to create a stand-alone build via the Build Service (see below).
</section>
<section class="docs-section" id="deploying-to-cloud">

## Deploying your App to AppGyver Cloud

To deploy your app to AppGyver Cloud for QR code sharing and to utilize the Build Service, the Steroids CLI needs to create a `config/cloud.json` file that will store your App ID and a secure hash. Run

```
steroids deploy --allowConfigCreation
```

in your project folder to deploy your app to the cloud. You can then utilize the QR code sharing or the [Build Service](/tooling/build-service), just like you would with a Supersonic app.

**Note that your project's Cordova plugins are not automatically configured in the Build Service.** You must include them manually in the Plugins field.

</section>
<section class="docs-section" id="known-issues">

## Known Issues

There's currently a few known issues, listed below. If you run into any trouble, please open a ticket with repro instructions on our [GitHub issue tracker](https://github.com/AppGyver/steroids/issues).

### Supersonic Data doesn't work with Cordova projects

Currently, Supersonic Data requires a Supersonic project to work. Based on user demand, we will be adding support for this in the future.

### Connect Screen Logs require Supersonic

The Logs page in Connect Screen currently only connects log events from `supersonic.logger.*` (and `steroids.logger.*`) API calls. To use the Connect Screen logs, you need to include `supersonic.js` in your project. You can see an example of how Supersonic is included in `www/index.html` by creating an SPA project with `steroids create`.

</section>
