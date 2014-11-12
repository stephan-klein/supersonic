---
layout: docs_data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
parent_id: supersonic
section_id: setting-up-appgyver-database
---
<section class="docs-section" id="data-providers">
# AppGyver Sandbox

AppGyver's Sandbox Database, is a simple database that's meant to be used to rapidly bootstrap your app development. It's not meant for production use, but to save you the hassle of setting up a data backend when you start developing your app.

Database can be initialized either through connect screen or by Steroids CLI.

## Using Connect screen to define database to your application

Before we can add data, we need to deploy your app to the AppGyver Cloud. Open the Steroids Connect screen and head to the Cloud tab.

Ensure you're connected to the Internet and click on "Deploy". This will cause Steroids CLI to deploy your app to the cloud. Wait for it to finish, after which the screen will update to show the Data Manager:

<strong>kuva</strong>

As the Data Browser will tell you, your app doesn't have any data providers set. A data provider is basically a proxy between your app and the REST API from which your data is fetched from. They do all sorts of magic – you can read more in the Data Providers guide – but for now, we just want to add the Sandbox Database provider for our app.


Click on the "Initialize Sandbox Database" button. This will instruct the CLI to provision a new Sandbox Database for your app, as well as set up the data provider. After a moment, the view will refresh with the Sandbox Database now listed as an available data provider.

### Defining resources

Before we can add any data, we must create a new resource definition. Click on the "Add Resource" button.

Let's create a new resource with the name superheroes for our awesome superhero database app. Let's keep it simple – we'll have a name, alter_ego and publisher.

### Adding data

### Creating an App Scaffold

Now that we've got a few cool superheroes in our database, we want to show that in our app!

Navigate to the "Generate Scaffold" tab. Since we only have a single resource, it's automatically selected, so you can just click "Generate". This instructs the Steroids CLI to generate a CRUD scaffold for the superheroes resource.

### Interacting with Data in your App

If you open your app project in a text editor, you'll notice we have a new Superheroes module in app/superheroes/. Let's make our app start from the Superheroes index, and while we're at it, disable tabs. Open app/structure.coffee, comment out or remove the tabs item and add a new rootView object:

```bash
  rootView:
    location: "superheroes#index"
```

Save the document, and your app will update with just the index page of our Superhero app:

See [Third mile: adding data from backend](/first-mile/third-mile/) for more on configuring the Appgyver Sandbod Database.

Once you have the data configured, you can move to section [accessing data from device](data-management/accessing-data-from-device/).

## Using Steroids CLI to define database to your application

Setting up AppGyver Database and defining resources can also be done from Steroids CLI.

To start using data, your app should be deployed to cloud:

```bash
$ steroids deploy
```

Next, let's initialize Steroids Data for your app. Run:

```bash
$ steroids data init
```

### Adding a resource

Next up, we need to define one or more resources for your app. A resource (e.g. car) contains several columns (e.g. model, year, type, used) that define the schema for your data. Additionally, each column has a data type: string, number, integer, date or boolean.

To add a resource, you run:

```bash
$ steroids data resources:add car model:string year:integer type:string used:boolean
```

The resource schema is created in your app's SandboxDB with the given column names and column types.

You'll also notice that a `config/cloud-resources.raml` file is created – this defines the schema for your whole SandboxDB. It will get updated as you add/remove resources, and is consumed by the Steroids Data JS library for use in your app.

### Removing a resource

To remove a resource (and remove all data entries for that resource), run:

```bash
$ steroids data resources:remove car
```

### Listing resources

You can list the resources in your app by running:

```bash
$ steroids data resources:list
```

### Managing data

To add actual data entries for your resources, you need to use the Data-tab of the connect screen as described earlier in the document.

### Generating a CRUD app scaffold

To generate a HTML5 CRUD (Create, Read, Update and Delete) scaffold for a resource, run:

```bash
$ steroids data scaffold car
```

Steroids will fetch the columns for your resource from the backend and generate a CRUD scaffold. You can see the files created in the output of the command. Notice that you need to change the `supersonic.config.location` property in config/application.coffee to match your resource:

```html
steroids.config.location = "http://localhost/views/car/index.html"
```

Now, run your Steroids app to see it in action, and check the source code for the syntax!

### Resetting Steroids Data

To reset your SandboxDB, you can run:

```bash
$ steroids data reset
```

Note that this removes all data in your SandboxDB and cannot be undone, so beware!

Once you have the data configured, you can move to section [accessing data from device](data-management/accessing-data-from-device/).

</section>