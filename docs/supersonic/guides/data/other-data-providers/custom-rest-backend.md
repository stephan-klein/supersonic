---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs to access local and cloud data
parent_id: supersonic
section_id: other-data-providers
subsection_id: custom-rest-backend
---

# Setting up a custom REST backend with Supersonic Data

Using a custom REST backend requires a bit more setup compared to the other Data Providers. As an example, we'll use [JSONPlaceholder](http://jsonplaceholder.typicode.com/), which provides a free REST service for development purposes.

A list of posts can be fetched by making a HTTP GET request to the URL [http://jsonplaceholder.typicode.com/posts](http://jsonplaceholder.typicode.com/posts), and that an post is accessed by adding the identifier of the post to the URL, e.g. with [http://jsonplaceholder.typicode.com/posts/1](http://jsonplaceholder.typicode.com/posts/1). We need to configure these actions in order for Supersonic Data to access the API.

## Setup

After [initializing data](/supersonic/guides/data/setting-up-appgyver-database/) for your app, select the Custom REST API from the list of available providers.

All the URLs of the API are prefixed with the base URL: [http://jsonplaceholder.typicode.com/](http://api.openbeerdatabase.com/). This is the _Base URL_ we should set up when defining the custom data provider.

<img class="tutorial-image" src="/img/guides/data/custom_init.png">

In the Config dialog we could also define the authentication scheme and add some default request headers for the requests Supersonic Data makes.

<img class="tutorial-image" src="/img/guides/data/custom_init2.png">

Since authentication and header definitions are not needed for JSONPlaceholder, we can skip those.

## Adding Resources

Next step is to add resources for the provider. The dialog asks for the resource name and URL path. Enter those:

<img class="tutorial-image" src="/img/guides/data/custom_resource_conf.png">

Note that for the path you should specify only the part of the path that is shared by all the resource operations, i.e. just `posts`, not `posts/1`. After creating the resource, the data will be pulled from JSONPlaceholder and the resource model will be automatically configured.

<img class="tutorial-image" src="/img/guides/data/custom_resource_model.png">

Not all resource providers will be automatically configured. For more specialized use cases, you have the option to provide additional configuration via the "Customize actions" button.

## Customizing actions for a resource

One of the most common stumbling blocks for automatic data configuration is the scenario where the response is an object that has some metadata as well as an array of result objects. For Supersonic Data to access the actual results, you would need to index the response with the _root key_. For example, let's say the data returned by JSONPlaceholder looked something like the following:

```json
{
  page: 1,
  pages: 15,
  posts: [
    {
      userId: 1,
      id: 1,
      title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
    },
    {
      userId: 1,
      id: 2,
      title: "qui est esse",
      body: "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla"
    },
    ...
  ]
}
```

In this scenario, you would need to set the root key `posts` for the resource to be properly loaded.

## Going forward

The custom data is now all set up. JSONPlaceholder supports all HTTP verbs, so feel free to experiment with different Supersonic Data requests. Now you can also browse the data in API on the Data Browser tab, or scaffold a CRUD application using your resource from the Generate Scaffolds tab.

Refer to the [Setting Up AppGyver Database](/supersonic/guides/data/setting-up-appgyver-database/) and [Accessing Data from Device](/supersonic/guides/data/accessing-data-from-device/) guides for more information on Supersonic Data.
