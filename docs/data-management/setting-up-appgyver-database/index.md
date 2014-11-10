---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
section_id: setup
subsection_id: data-providers
---

# Overview

AppGyver's Sandbox Database, is a simple database that's meant to be used to rapidly bootstrap your app development. It's not meant for production use, but to save you the hassle of setting up a data backend when you start developing your app.

# Initializing Sandbox database

Before we can add data, we need to deploy your app to the AppGyver Cloud. Open the Steroids Connect screen (if you've closed it, run qr in the Steroids Development Server console to open it again), and head to the Data tab.

Ensure you're connected to the Internet and click on "Deploy". This will cause Steroids CLI to deploy your app to the cloud. Wait for it to finish, after which the screen will update to show the Data Manager:

As the Data Browser will tell you, your app doesn't have any data providers set. A data provider is basically a proxy between your app and the REST API from which your data is fetched from. They do all sorts of magic – you can read more in the Data Providers guide – but for now, we just want to add the Sandbox Database provider for our app.

The Sandbox Database is a free development database provided by AppGyver. It's not intended for full-on production use, but it's great for getting a first version of your app up and running.

Click on the "Initialize Sandbox Database" button. This will instruct the CLI to provision a new Sandbox Database for your app, as well as set up the data provider. After a moment, the view will refresh with the Sandbox Database now listed as an available data provider.

# Defining resources