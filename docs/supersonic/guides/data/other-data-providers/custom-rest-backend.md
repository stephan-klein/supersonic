---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs to access local and cloud data
parent_id: supersonic
section_id: other-data-providers
subsection_id: custom-rest-backend
---

# Setting up a custom REST backend with Supersonic Data

Using a custom REST backend requires a bit more setup compared to the other Data Providers. As an example, we'll use the [Open Beer Database](http://openbeerdatabase.com/) which provides free information on various beers and breweries.

From the [API documentation](http://openbeerdatabase.com/documentation/breweries-get), we see that the list of beers can be fetched by making a HTTP GET request to the URL [http://api.openbeerdatabase.com/v1/beers.json](http://api.openbeerdatabase.com/v1/beers.json), and that an individual beer is accessed by adding the identifier of the beer to the URL, e.g. with [http://api.openbeerdatabase.com/v1/beers/27.json](http://api.openbeerdatabase.com/v1/beers/27.json). We need to configure these actions in order for Supersonic Data to access the API.

## Setup

After [initializing data](/supersonic/guides/data/setting-up-appgyver-database/) for your app, select the Custom REST API from the list of available providers.

All the URLs of the API are prefixed with the base URL and API version number: [http://api.openbeerdatabase.com/v1/](http://api.openbeerdatabase.com/v1/). This is the _Base URL_ we should set up when defining the custom data provider.

<img class="tutorial-image" src="/img/guides/data_custom_init.png">

In the Config dialog we could also define the authentication scheme and add some default request headers for the requests Supersonic Data makes.

<img class="tutorial-image" src="/img/guides/data_custom_init2.png">

Since authentication and header definitions are not needed for the Open Beer Database, we can skip those.

## Adding Resources

Next step is to add resources for the provider. The dialog asks for the resource name and URL path. Enter those:

<img class="tutorial-image" src="/img/guides/data_custom_resource_conf.png">

Note that for the path you should specify only the part of the path that is shared by all the resource operations, i.e. just `beers`, not `beers/1`.

After creating the resource we get a notification stating that the data configurator was unable to read the resource's data model from the backend:

<img class="tutorial-image" src="/img/guides/data_custom_no_model.png">

This due to the fact that we have not yet customized how the API requests should actually be made (and the defaults don't work for our particular API).

## Customizing actions for a resource

Our first problem is that the URL we set up – [http://api.openbeerdatabase.com/v1/beers](http://api.openbeerdatabase.com/v1/beers) – doesn't return anything. From the Open Beer Database API description, we learn that this can be fixed by appending `.json` to the request (some other APIs might return correct data without having to specify a file type).

Next, let's have a closer look at the data returned by a request to  [http://api.openbeerdatabase.com/v1/beers.json](http://api.openbeerdatabase.com/v1/beers.json):

<img class="tutorial-image" src="/img/guides/data_custom_response.png">

As we can see, the response is an object that has some metadata (describing the subset of all available data that was returned) as well as an array of beer objects called `beers`. For Supersonic Data to access the beers collection, we need to index the response with the _root key_ `beers`.

By clicking on the Customize Actions button, we can configure the root key and add the `.json` suffix for the GET COLLECTION action:

<img class="tutorial-image" src="/img/guides/data_custom_actions1.png">

You should also set the `.json` suffix for the GET action. (The Open Beers Database API doesn't allow modifying the data, so we're stuck with viewing a collection or a single beer.)

## Going forward

We're ready to go now. Click the Reload Model From API button. After a moment, the Beer data model should be correctly populated with data from the backend.


Now you can e.g. browse the data in API on the Data Browser tab, or scaffold a CRUD application using your resource from the Generate Scaffolds tab.

Refer to the [Setting Up AppGyver Database](/supersonic/guides/data/setting-up-appgyver-database/) and [Accessing Data from Device](/supersonic/guides/data/accessing-data-from-device/) guides for more information on Supersonic Data.
