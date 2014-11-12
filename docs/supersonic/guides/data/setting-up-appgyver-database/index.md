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

## Defining resources

After initialization you will see AppGyver Sandbox Database as a configured provider.

Resources can be defined by clicking the provider and then pressing "add new resource". Resource is given a name and set of fields. After fields are defined, "save changes to data model" should be pressed in order to synch the data definition to the cloud and to the device.

The data definition is saved in the file `config/cloud-resources.raml` of the steroids project. The file will get updated as resources are added or edited, and is consumed by the Supersonic Data JS library for use in your app.

## Adding data

The documents in the defined resource can be browsed and edited with "Data browser", where one can navigate from top of the "Data" tab.

## Creating an App Scaffold

After generating resources, the "Generate Scaffold" tab allows one to generate CRUD application scaffold for the defined resource.

See [Third mile: adding data from backend](/supersonic/tutorial/third-mile/) for more on configuring the AppGyver Sandbox Database and
 [Fourth mile: app architecture](/supersonic/tutorial/fourth-mile/) on description of the scaffolded CRUD app structure.

Once you have the data configured, you can move to section [accessing data from device](data-management/accessing-data-from-device/).

</section>