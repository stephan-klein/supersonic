---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs to access local and cloud data
parent_id: supersonic
section_id: other-data-providers
subsection_id: designing-your-own-backend
---

# Designing your own backend that works with Supersonic Data

For your own backend to work with Supersonic Data, it needs to adhere to the [Representational State Transfer architecture](http://en.wikipedia.org/wiki/Representational_state_transfer). In short, it needs to be RESTful. All custom backends are configured via the [Custom REST backend](/supersonic/guides/data/other-data-providers/custom-rest-backend/) provider, so it is a good idea to go through that guide first.

In the case Supersonic Data, your backend should behave as follows:

## Authentication

Your backend can be accessible without authentication or via Basic Auth. Basic Auth is set up as a single username/password for the whole backend.

You can also pass in an access/API token as part of request headers. You can set up custom headers for all requests to your backend in your Provider's settings. Alternatively, you can add them to individual requests via the Customize Settings button, found under an individual Resource.

Other authentication methods or access control lists (ACLs) for multiple users are not currently supported.

## API structure

### Collection endpoint

Your API should have one endpoint for getting a collection, e.g.

`http://my-api.com/venues/`

This should return a JSON object that contains the collection members as an array. The array can be nested a maximum one level deep, e.g.

```json
{
  some_data: "whee"
  venues: [
    ...
  ]
}
```

is alright but

```json
{
  some_data: {
    venues: [
      ...
    ]
  }
}
```
cannot be used. If the collection is nested inside the returned object, you need to specify a _Root Key_ via the Customize Actions button (the root key would be `venues` in the above case).

### Individual resource endpoint

There should be another endpoint for getting an individual resource in that collection (by its id), e.g.

`http://my-api.com/venues/24`

This should return the object with id `24` as JSON.

Each resource should have an ID property that is guaranteed to be unique by the backend. The ID can be alphanumeric, but must have a numeric part (i.e. `venue45` is OK – you just need to configure it via the Customize Actions button).

The ID property doesn't have to be named `id` in the returned object – when adding the Custom REST API as a data provider, you can choose which property is used as ID.

### Other backend responses

See the table below for a list of HTTP request types used by Supersonic Data, as well as description of how the backend is expected to respond.

<table class="table">
<caption>How Supersonic Data expects your backend to respond to various HTTP requests</caption>
<thead>
  <tr>
    <th>Resource</th>
    <th>GET</th>
    <th>PUT</th>
    <th>POST</th>
    <th>DELETE</th>
  </tr>
</thead>
<tbody>
  <tr>
    <th scope="row">Collection URI, such as <code>http://my-api.com/venues/</code></th>
    <td>List the collection members, in JSON format.</td>
    <td>Not used.</td>
    <td>Create a new entry in the collection. The entry should get an auto-assigned unique id.</td>
    <td>Not used.</td>
  </tr>
  <tr>
    <th scope="row">Element URI, such as <code>http://my-api.com/venues/17</code></th>
    <td>Retrieve a representation of the addressed member of the collection, in JSON format.</td>
    <td>Replace the addressed member of the collection. If the member doesn't exist, return error, e.g. 422 Unprocessable Entity.</td>
    <td>Not used.</td>
    <td>Delete the addressed member of the collection.</td>
  </tr>
</tbody>
</table>

If your API behaves like listed above, you should be good to go with Supersonic Data!

Refer to the [Setting Up AppGyver Database](/supersonic/guides/data/setting-up-appgyver-database/) and [Accessing Data from Device](/supersonic/guides/data/accessing-data-from-device/) guides for more information on Supersonic Data.
