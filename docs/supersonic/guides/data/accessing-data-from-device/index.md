---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
section_id: accessing-data-from-device
parent_id: supersonic
---

<section class="docs-section">

# Accessing data from device

The [supersonic.data](api-reference/stable/supersonic/data/) namespace includes APIs that work with _any_ cloud data services [configured](/data-management/setting-up-appgyver-database/) for the application. They provide efficient ways for manipulating data – adding, updating and deleting records.

## supersonic.data

In the following we demonstrate how supersonic data makes it joyfully easy to manipulate resources in AppGyver Sandbox Database in a clean, object-oriented way.

Code snippets in above assume that the application has a resource `Beer` with two `string` fields `name` and `brewery`, and an `integer` field `brewed_since` configured.

Once a resource has been defined, app can get hold of it with method [supersonic.data.model](/api-reference/stable/supersonic/data/model/model/) which takes the resource name as parameter:

```js
Beer = supersonic.data.model('Beer')
```

## Getting data from the server

The call `supersonic.data.model('Beer')` returns a [supersonic.data.Model](/api-reference/stable/supersonic/data/model/model-class/) class, that provides methods to accessing the data of the resource.

The entire collection can be achieved by a [promise](/overview/promises/) returning function `findAll` of the Model class:

```js
# all the below examples assume that variable Beer has been created
Beer = supersonic.data.model('Beer')

Beer.findAll().then (allBeers) ->
  # access here the collection allBeers
```

The returned object `allBeers` is of type [supersonic.data.Collection](/api-reference/stable/supersonic/data/model/collection-class/) that acts like an `array`:

```js
Beer.findAll().then (allBeers) ->
  console.log "the first was #{beer[0].name}"

  for beer in allBeers
    console.log "#{beer.name} by #{beer.brewery} brewed since #{beer.brewed_since}"
```

Objects in the collection are instances of the class [supersonic.data.Model] (/api-reference/stable/supersonic/data/model/model-class/).

## Limiting the search

There are several ways to limit what and how many objects the method `findAll` returns.  Firstly one can implement, eg. pagination by using the options `skip` and `limit`:

```js
# first page
Beer.findAll({limit:10}).then (beers) ->

# second page
Beer.findAll({skip10, limit:10}).then (beers) ->
```

Option can also be a [Mongo DB](http://www.mongodb.org/) style of query parameter. The following returns all the beers where Brewery is "Schlenkerla":

```js
query = { "brewery": "Schlenkerla" }

Beer.findAll({query: JSON.stringify(query)}).then (beers) ->
```

Note that the value of the query has to be a stringified json.


## Three-way Data Binding

The most awesome feature of Supersonic data is it's ability to listen if the data has changed at the backend server. Listening the changes is done with method `all`:

```js
Beer.all().whenChanged (beers) ->
  console.log "the state of the beers has chaned, current "
  for beer in allBeers
    console.log "#{beer.name} by #{beer.brewery} brewed since #{beer.brewed_since}"
```

Any time there are changes in data, the registered callback function is called. So with Angular's databinding and magical touch of Supersonic data one can easily build applications where the data of _all_ the users is kept in sync all the time!

See more form [Steroids.data API](/api-reference/stable/supersonic/data/model/model-class/).

# Model instances

Method `find` in the Model class can be used to get a single object based on the identifier field:

```js
Beer.find("123").then (beer) ->
  console.log "beer with id 123 is #{beer.name} by #{beer.brewery}"
```

The returned objects are instances of [supersonic.data.Model] (/api-reference/stable/supersonic/data/model/model-class/).

A model instance can be edited and the edited version saved back to the cloud database:

```js
Beer.find("123").then (beer) ->
  beer.brewery = "Sierra Nevada Brewing"
  beer.save().then () ->
    console.log "beer saved"
```

It is also possible to delete model instances:

```js
Beer.find("555").then (beer) ->
  beer.delete().then () ->
    console.log "a crappy beer was deleted"
```

## Creating new model instances

Create and save new objects to database is easy:

```bash
object =
  name: "Arctic Cirle Ale"
  brewery: "Malmgard"
  brewed_since: 2009

beer = new Beer(object)
beer.save().then () ->
  console.log "beer created!"
```
Once the method `save` has been called to the Model instance, the new object is saved to the backing database. And thanks to three way data binding, all the apps who have registered for the changes in collection Beers will get updated with the new data!

## Further reading

Learn more about  Supersonic.data from the [API docs][data-api].

</section>

[data-api]: /supersonic/api-reference/stable/supersonic/data