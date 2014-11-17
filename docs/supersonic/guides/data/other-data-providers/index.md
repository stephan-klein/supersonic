---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
parent_id: supersonic
section_id: other-data-providers
---

# Other providers

Besides the AppGyver Database, Supersonic provides an easy way to integrate application to various backends such as [built.io](https://www.built.io/), [Parse](https://www.parse.com/), [Kimono](https://www.kimonolabs.com/) or any custom REST backend.

## Using Built.io backend

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

## Using Parse, Kimono or custom REST bakend

Support comming soon.