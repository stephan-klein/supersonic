---
layout: docs_first_mile
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn the basics of modifying your app structure and logic
section_id: third-mile
subsections:
  - name: Overview
  - name: Deploying Your App to the Cloud
  - name: Initializing the Sandbox Database
  - name: Defining a Resource
  - name: Adding Data
  - name: Creating an App Scaffold
  - name: Data in your App
  - name: Three-way Data Binding
  - name: More with Data
---
<section class="docs-section" id="overview">
## Overview

In the First and Second miles, we've covered how to:

 - Create an app and get it running on your device
 - Do declarative UI and navigation
 - Style native components with CSS
 - Add logic to your app with AngularJS
 - Access device APIs

Next up, we want to tackle the last missing piece: data. Nearly all apps use data in some form, so we've ensured that it's a super smooth experience to add data to your app – regardless of the source.
</section>

<section class="docs-section" id="deploying-your-app-to-the-cloud">
## Deploying Your App to the Cloud

Before we can add data, we need to deploy your app to the AppGyver Cloud. Open the Steroids Connect screen (if you've closed it, run `qr` in the Steroids Development Server console to open it again), and head to the Data tab.

<img src="http://placehold.it/600x400">

Ensure you're connected to the Internet and click on "Deploy". This will cause Steroids CLI to deploy your app to the cloud. Wait for it to finish, after which the screen will update to show the Data Manager:

<img src="http://placehold.it/600x400">
</section>

<section class="docs-section" id="initializing-the-sandbox-database">
## Initializing the Sandbox Database

As the Data Browser will tell you, your app doesn't have any data providers set. A data provider is basically a proxy between your app and the REST API from which your data is fetched from. They do all sorts of magic – you can read more in the [Data Providers][data-providers] guide – but for now, we just want to add the Sandbox Database provider for our app.

The Sandbox Database is a free development database provided by AppGyver. It's not intended for full-on production use, but it's great for getting a first version of your app up and running.

Click on the "Initialize Sandbox Database" button. This will instruct the CLI to provision a new Sandbox Database for your app, as well as set up the data provider. After a moment, the view will refresh with the Sandbox Database now listed as an available data provider.

<img src="http://placehold.it/600x400">

Click on it to open the Data Manager.
</section>

<section class="docs-section" id="defining-a-resource">
## Defining a Resource

Before we can add any data, we must create a new resource definition. Click on the "Add Resource" button.

Let's create a new resource with the name `superheroes` for our awesome superhero database app. Let's keep it simple – we'll have a `name`, `alter_ego` and `publisher`.
</section>

<section class="docs-section" id="adding-data">
## Adding Data

Now, you can click on the "Add Data" button to add an actual entry to the database. Let's add a few characters – you can copypaste the data below:

<table class="table">
  <tr>
    <th>Name</th>
    <th>Alter Ego</th>
    <th>Publisher</th>
  </tr>
  <tr>
    <td>Superman</td>
    <td>Clark Kent</td>
    <td>DC Comics</td>
  </tr>
  <tr>
    <td>Batgirl</td>
    <td>Barbara Gordon</td>
    <td>DC Comics</td>
  </tr>
  <tr>
    <td>Deadpool</td>
    <td>Wade Winston Wilston</td>
    <td>Marvel Comics</td>
  </tr>
  <tr>
    <td>Scarlet Witch</td>
    <td>Wanda Maximoff</td>
    <td>Marvel Comics</td>
  </tr>
</table>

Though the Connect Screen does its best to keep up with changes, you can always click the "Resync" button to ensure your local project has the latest configs (the actual data is always fetched from the backend).
</section>

<section class="docs-section" id="creating-an-app-scaffold">
## Creating an App Scaffold

Now that we've got a few cool superheroes in our database, we want to show that in our app!

Navigate to the "Generate Scaffold" tab. Since we only have a single resource, it's automatically selected, so you can just click "Generate". This instructs the Steroids CLI to generate a CRUD scaffold for the `superheroes` resource.
</section>

<section class="docs-section" id="data-in-your-app">
## Interacting with Data in your App

If you open your app project in a text editor, you'll notice we have a new Superheroes module in `app/superheroes/`. Let's make our app start from the Superheroes index, and while we're at it, disable tabs. Open `app/structure.coffee`, comment out or remove the tabs item and add a new `rootView` object:

```coffeescript
rootView:
  location: "superheroes#index"
```

Save the document, and your app will update with just the index page of our Superhero app:

<img src="http://placehold.it/400x600">

Now, click on any of the superheroes to view more details. You can edit superheroes or remove them. From the index view, you can also create new superheroes.
</section>

<section class="docs-section" id="three-way-data-binding">
## Three-way Data Binding

If you now look at the Data Browser in the Connect Screen again, you'll see that it has updated with your modified data. As you can see if you peek inside the source code, AngularJS takes care of keeping your view in sync, and Supersonic Data does the hard lifting for syncing changes between the cloud and your device.
</section>

<section class="docs-section" id="more-with-data">
## More with Data

That's it! You've now got a fully functioning app with real live data bolted on. Feel free to play around, browse the docs or go to the [forums](https://forums.appgyver.com) if you run into trouble.

You can find all the rest of guides and tutorials on data in the [Data Management][data-management] section.

Happy hacking!
</section>

[data-providers]: /supersonic/guides/supersonic-data/setup/data-providers
[data-management]: /supersonic/guides/supersonic-data
