---
layout: docs_data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
parent_id: supersonic
section_id: setting-up-appgyver-database
---
<section class="docs-section" id="data-providers">
# AppGyver Sandbox

AppGyver's Sandbox Database, is a simple database that's meant to be used to rapidly bootstrap your app development. It's not meant for production use, but to save you the hassle of setting up a data backend when you start developing your app.

## Deloying application to cloud and initializing the database

Steroids Sandbox database is initialized by pressing "Initialize"
from the "Data" tab of Connect screen. If application is not yet deployed to cloud a deployment is also made at the database initialization.

<img class="tutorial-image" src="/img/guides/data_init.png">

## Defining resources

After initialization you will see AppGyver Sandbox Database as a configured provider.

<img class="tutorial-image" src="/img/guides/data_providers.png">

Resources can be defined by clicking the provider and then pressing "add new resource".

<img class="tutorial-image" src="/img/guides/data_provider.png">

Resource is given a name and the data model, i.e. a set of fields is defined:

<img class="tutorial-image" src="/img/guides/data_fields.png">

After fields are defined, "save changes to data model" should be pressed in order to synch the data definition to the cloud and to the device.

The data definition is saved in the file `config/cloud-resources.raml` in the Supersonic project. The file will get updated as resources are added or edited, and is consumed by the Supersonic Data JS library for use in your app.

## Editing and deleting resources

Defined resources can be edited at any time. The name of the resource can be changed by clicking "Manage resource". New fields can be added and existing removed. In case there are changes in field definitions, the "save changes to data model" should be pressed. A resource can also be removed by pressing "Remove resource".

## Accessing data with Data browser

The documents in the defined resource can be created, seen, edited amd deleted with "Data browser", where one can navigate from top of the "Data" tab:

<img class="tutorial-image" src="/img/guides/data_browser.png">

## Creating an Application Scaffold

After generating resources, the "Generate Scaffold" tab allows one to generate CRUD application scaffold for the defined resource:

<img class="tutorial-image" src="/img/guides/data_scaffold.png">

The scaffolded code appears under the app directory of the application project. After the scaffolds are created, connect screen gives a hint how to utilize the scaffolded code in your app:

<img class="tutorial-image" src="/img/guides/data_scaffolded.png">

See [the Supersonic Architecture guide](http://localhost:4000/supersonic/guides/architecture/architecture/) for a in-depth description of the scaffolded CRUD application structure.

Once you have the data configured, you can move to the section [accessing data from device](/supersonic/guides/data/accessing-data-from-device/).

</section>