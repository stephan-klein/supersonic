---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
section_id: setup
subsection_id: data-providers
---

# Accessing data from device

The [supersonic.data](api-reference/stable/supersonic/data/) namespace includes APIs that work with any cloud data services [configured](/data-management/setting-up-appgyver-database/) for the application. They provide efficient ways for manipulating data – adding, updating and deleting records.

## supersonic.data

Supersonic data provides a clean object-oriented way of manipulating data that is backed by a cloud data storage such as the AppGyver Sandbox Database.

Code snippets in allow assume that the application has defined a resource `Beer` with two `string` fields `name` and `brewery`, and an `integer` field `brewed_since` configured throught the Data configurator of the Connect Screen.

Once a resource has been defined, app can get hold of it with method [supersonic.data.model](/api-reference/stable/supersonic/data/model/model/) which takes as the parameter the resource name as string:

```js
  Beer = supersonic.data.model('Beer')
```

## Getting data from server

Method returns an instance of [supersonic.data.Model](/api-reference/stable/supersonic/data/model/model-class/), that profides methods of accessing resource collections and individual resources.

The entire collection can be achieved by a [promise](/overview/promises/) returning function `findAll`

```js
  Beer.findAll().then (allBeers) ->
    # access here the collection allBeers
```

The returned object is of type [supersonic.data.Collection](/api-reference/stable/supersonic/data/model/collection-class/) that acts like an `array`:

```js
  Beer.findAll().then (allBeers) ->
    console.log "the first was #{beer[0].name}"

    for beer in allBeers
      console.log "#{beer.name} by #{beer} has been brewed since #{beer.brewed_since}""
```

The individual resource objects are of the type [supersonic.data.Model] (/api-reference/stable/supersonic/data/model/model-class/).


## Models in Angular views

Objects of the type [supersonic.data.Model] (/api-reference/stable/supersonic/data/model/model-class/) work nearly like normal JS objects, however there properties of the objects are not attached directly but through getter methods that are in the prototype of the Model objects. Because of this, if a Model needs to be rendered in Angular view, the bind syntax should be used instead of the 'double mustaches':

```html
  <ul>
    <li ng-repeat="beer in beers">
      <span ng-bind="beer.name"></span> brewed by <span ng-bind="beer.brewery"></span>
    </li>
  </ul>
```

or the properties should be accessed throught the 'hidden' property `__data` of Model objects:

```html
  <ul>
    <li ng-repeat="beer in beers">
      {{beer.__data.name}} brewed by {{beer.__data}}
    </li>
  </ul>
```

## Limiting the search

## Three-way Data Binding

The most awesome feature of Supersonic data is it's ability to sniff the changes that



If you now look at the Data Browser in the Connect Screen again, you'll see that it has updated with your modified data. As you can see if you peek inside the source code, AngularJS takes care of keeping your view in sync, and Supersonic Data does the hard lifting for syncing changes between the cloud and your device.

# Creating, editing and updating Model objects

```bash
```

```bash
```

```bash
```

See more [/stable/supersonic/data/](/stable/supersonic/data/)