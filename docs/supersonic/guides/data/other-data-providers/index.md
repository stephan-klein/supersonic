---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
parent_id: supersonic
section_id: other-data-providers
---

# Other providers

Besides the AppGyver Database, Supersonic provides an easy way to integrate application to various backends such as [built.io](https://www.built.io/), [Parse](https://www.parse.com/) or any custom REST backend.

## built.io backend

Once you have the data [initialized](/supersonic/guides/data/setting-up-appgyver-database/), besides the readily configured Sandbox Database, you have a list of available pre configured data providers, one of which is the AppGyver official API partner [built.io](https://www.built.io/):

<img class="tutorial-image" src="/img/guides/data_available_providers.png">

Integrating a built.io backend to a Supersonic application is super simple.

At the start the data model for the application is defined in the [built.io website](https://www.built.io/):

<img class="tutorial-image" src="/img/guides/data_built_io_class.png">

Note that you should create at least one object to each defined resource to enable the integration to Supersonic!

Once the data model is defined and some initial data seeded to resources, the backend can be connected to Supersonic app.

One starts by clicking the "built.io" from the list of available providers. The wizard asks the built.io apikey:

<img class="tutorial-image" src="/img/guides/data_built_io_new.png">

When a resource is added, the fields defined for the data model are automatically set up:

<img class="tutorial-image" src="/img/guides/data_built_io_ready.png">

You are then ready to use the data! Please see from [setting up database guide](/supersonic/guides/data/setting-up-appgyver-database/) how to access data from data browser and how to scaffold data accessing application code, and [accessing data from device](/supersonic/guides/data/accessing-data-from-device/) for overview of Supersonic data JS library.

## Parse backend

Usage of Parse is as easy as the use of built.io. In order to configure Parse, you must configure an backend through Parse web site, and get the id and the api key of your app:

<img class="tutorial-image" src="/img/guides/data_parse_conf.png">

Next step is to select Parse from the list of avaliable providers, and to feed the application id and rest api key the the configuration dialog:

<img class="tutorial-image" src="/img/guides/data_parse_provider.png">

From this point on, configuring the resources proceeds simillarly as in the case of the rest of the providers.

## Custom REST backend

Using a custom REST backend involves couple of more steps. Let us take as an example the [Open Beer Database](http://openbeerdatabase.com/) that provides information of various beers and breweries.

From the [API documentation](http://openbeerdatabase.com/documentation/breweries-get) we see that the list of beers can be achieved by making a HTTP GET request to url [http://api.openbeerdatabase.com/v1/beers.json](http://api.openbeerdatabase.com/v1/beers.json) and an individual beer is accessed by adding the identifier of the beer to the url, e.g. with [http://api.openbeerdatabase.com/v1/beers/27.json](http://api.openbeerdatabase.com/v1/beers/27.json).

All the urls of the API are prefixed with [http://api.openbeerdatabase.com/v1](), and we can set this as the _base url_ when defining the custom provider:

<img class="tutorial-image" src="/img/guides/data_custom_init.png">

In the config dialog we could also define the authentication scheme and add some default request headers for the requests:

<img class="tutorial-image" src="/img/guides/data_custom_init2.png">

Authentication ad header definitions not needed in open beer database, so we skip those.

Next step is to add resources for the provider. The dialog asks for both, the resource name and the resource url path:

<img class="tutorial-image" src="/img/guides/data_custom_resource_conf.png">

Note that for the path you should specify only the part of the path that is shared by all the resource operations.


After creation of the resource we get a notification stating that the configurator was unable to read the data model of the resource:

<img class="tutorial-image" src="/img/guides/data_custom_no_model.png">

This due to the fact that we have not yet customized how the API requests to e.g. get a collection of beers or get an individual beer should actually be made.

Let us have a closer look at the data a [request](http://api.openbeerdatabase.com/v1/beers.json)  to the API returns:

<img class="tutorial-image" src="/img/guides/data_custom_response.png">

As can be seen, the response is an object that has some metadata (describing what subset of all the data was returned) as well as the objects that represent the collection of beers. The collection is accessed by indexing the response with the  _root key_ `beers`.

By clicking 'customize actions' one can configure the root key for data access and the prefix '.json' of the collection path:

<img class="tutorial-image" src="/img/guides/data_custom_actions1.png">

The access path prefix should also be defined for action 'get':

<img class="tutorial-image" src="/img/guides/data_custom_actions1.png">

With there definitions in place we are ready to go. We can e.g. browse the data in API with 'data browser' or scaffold a CRUD application in the tab 'Generate scaffolds'.

Refer [setting up database](/supersonic/guides/data/setting-up-appgyver-database/) and [accessing data from device](/supersonic/guides/data/accessing-data-from-device/) for more information of data usage.
