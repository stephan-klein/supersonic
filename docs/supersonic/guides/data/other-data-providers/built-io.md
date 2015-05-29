---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs to access local and cloud data
parent_id: supersonic
section_id: other-data-providers
subsection_id: built-io
---

# Setting up a Built.io backend

Make sure you have [initialized data](/supersonic/guides/data/setting-up-appgyver-database/) for your app. On the Providers page in the Steroids Connect screen, you should see [built.io](https://www.built.io/) as one of the available options.

<img class="tutorial-image" src="/img/guides/data_available_providers.png">

Before adding the built.io data provider, ensure that the data model for your application is set up in the [built.io admin console](https://www.built.io/):

<img class="tutorial-image" src="/img/guides/data_built_io_class_1.png">

<img class="tutorial-image" src="/img/guides/data_built_io_class_2.png">

After setting up the data model, you should create at least one object to each defined resource. This ensures that Supersonic Data can fetch an example object from the built.io backend and populate the Supersonic Data resource schema automatically.

Once the data model is defined and some initial data seeded to the resources, you can select built.io from the list of available providers. A wizard appears asking for your built.io API key. Input it there.

<img class="tutorial-image" src="/img/guides/data_built_io_new.png">

Next, you can add a resource. Make sure its name matches the one in your Built.io backend. After adding the resource, available fields are automatically populated.

<img class="tutorial-image" src="/img/guides/data_built_io_ready.png">

Everything is now set up – if you add or modify a resource via Supersonic Data, the changes get reflected to the built.io backend, and similarly up-to-date data from your built.io backend is available in your Supersonic app.

Please see the [Setting Up AppGyver Database](/supersonic/guides/data/setting-up-appgyver-database/) guide for instructionos on how to access data via the data browser and how to create a CRUD scaffold for your Supersonic app. In addition, the [Accessing Data from Device](/supersonic/guides/data/accessing-data-from-device/) section provides an overview of the Supersonic Data JS library.
