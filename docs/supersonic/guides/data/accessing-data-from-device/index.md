---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs having to do with the properties and hardware of your mobile device.
section_id: accessing-data-from-device
parent_id: supersonic
---
<section class="ag__docs__content">
<section class="docs-section" id="accessing-data-from-device">

# Accessing data from device

The [supersonic.data](api-reference/stable/supersonic/data/) namespace includes APIs that work with _any_ cloud data providers [configured](/data-management/setting-up-appgyver-database/) for the Supersonic application. They provide efficient ways for manipulating data – adding, updating and deleting records.

</section>
<section class="docs-section" id="supersonic-data">

## supersonic.data

In the following we demonstrate how supersonic data makes it joyfully easy to manipulate resources in the defined backend database (such as AppGyver sandbox DB) in a clean, object-oriented way.

Code snippets in below assume that the application has a resource `Beer` with two `string` fields `name` and `brewery`, and an `integer` field `brewed_since` configured.

Once a resource has been defined, app can get hold of it with method [supersonic.data.model](/api-reference/stable/supersonic/data/model/model/) which takes the resource name as parameter:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var Beer = supersonic.data.model('Beer');
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
Beer = supersonic.data.model('Beer')
{% endhighlight %}
</div>

</section>
<section class="docs-section" id="getting-data-from-the-server">

## Getting data from the server

The call `supersonic.data.model('Beer')` returns a [supersonic.data.Model](/api-reference/stable/supersonic/data/model/model-class/) class, that provides methods to accessing the data of the resource.

The entire collection can be achieved by a [promise](/overview/promises/) returning function `findAll` of the Model class:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
// all the below examples assume that variable Beer has been created
var Beer = supersonic.data.model('Beer')

Beer.findAll().then( function(allBeers) {
  // access here the collection allBeers
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
# all the below examples assume that variable Beer has been created
Beer = supersonic.data.model('Beer')

Beer.findAll().then (allBeers) ->
  # access here the collection allBeers
{% endhighlight %}
</div>

The returned object `allBeers` is of type [supersonic.data.Collection](/api-reference/stable/supersonic/data/model/collection-class/) that acts like an `array`:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
Beer.findAll().then( function(allBeers) {
  console.log("the first was " + allBeers[0].name);

  for (i = 0; i < allBeers.length; i++) {
    console.log(allBeers[i].name + " by " + allBeers[i].brewery + " brewed since " + allBeers[i].brewed_since);
  }
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
Beer.findAll().then (allBeers) ->
  console.log "the first was #{allBeers[0].name}"

  for beer in allBeers
    console.log "#{beer.name} by #{beer.brewery} brewed since #{beer.brewed_since}"
{% endhighlight %}
</div>

Objects in the collection are instances of the class [supersonic.data.Model] (/api-reference/stable/supersonic/data/model/model-class/).

</section>
<section class="docs-section" id="limiting-the-search">

## Limiting the search

There are several ways to limit what and how many objects the method `findAll` returns.  Firstly one can implement, eg. pagination by using the options `skip` and `limit`:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
// first page
Beer.findAll({limit:10}).then(function(beers) {});

// second page
Beer.findAll({skip10, limit:10}).then(function(beers) {});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
# first page
Beer.findAll({limit:10}).then (beers) ->

# second page
Beer.findAll({skip10, limit:10}).then (beers) ->
{% endhighlight %}
</div>

Option can also be a query parameter. AppgGyver Sandbox Database uses [Mongo DB](http://www.mongodb.org/) query syntax.

The following returns all the beers where the Brewery is "Schlenkerla":

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var query = { "brewery": "Schlenkerla" };

Beer.findAll({query: JSON.stringify(query)}).then(function(beers) {});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
query = { "brewery": "Schlenkerla" }

Beer.findAll({query: JSON.stringify(query)}).then (beers) ->
{% endhighlight %}
</div>

Note that the value of the query has to be a stringified json.

</section>
<section class="docs-section" id="three-way-data-binding">

## Three-way Data Binding

The most awesome feature of Supersonic data is it's ability to listen if the data has changed at the backend server. Listening the changes is done with method `all`:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
Beer.all().whenChanged( function(beers) {
  console.log("the state of the beers has changed, current ");
  for (i = 0; i < beers.length; i++) {
    console.log(beers[i].name + " by " + beers[i].brewery + " brewed since " + beers[i].brewed_since);
  }
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
Beer.all().whenChanged (beers) ->
  console.log "the state of the beers has changed, current "
  for beer in beers
    console.log "#{beer.name} by #{beer.brewery} brewed since #{beer.brewed_since}"
{% endhighlight %}
</div>

Any time there are changes in data, the registered callback function is called. So with Angular's databinding and magical touch of Supersonic data one can easily build applications where the data of _all_ the users is kept in sync all the time!

See more form [Steroids.data API](/api-reference/stable/supersonic/data/model/model-class/).

</section>
<section class="docs-section" id="model-instances">

## Model instances

Method `find` in the Model class can be used to get a single object based on the identifier field:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
Beer.find("123").then( function(beer) {
  console.log("beer with id 123 is " + beer.name + " by " + beer.brewery);
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
Beer.find("123").then (beer) ->
  console.log "beer with id 123 is #{beer.name} by #{beer.brewery}"
{% endhighlight %}
</div>

The returned objects are instances of [supersonic.data.Model] (/api-reference/stable/supersonic/data/model/model-class/).

A model instance can be edited and the edited version saved back to the cloud database:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
Beer.find("123").then( function(beer) {
  beer.brewery = "Sierra Nevada Brewing";
  beer.save().then( function() {
    console.log("beer saved");
  });
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
Beer.find("123").then (beer) ->
  beer.brewery = "Sierra Nevada Brewing"
  beer.save().then () ->
    console.log "beer saved"
{% endhighlight %}
</div>

It is also possible to delete model instances:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
Beer.find("555").then( funtion(beer) {
  beer.delete().then( function() {
    console.log("a crappy beer was deleted");
  });
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
Beer.find("555").then (beer) ->
  beer.delete().then () ->
    console.log "a crappy beer was deleted"
{% endhighlight %}
</div>

### Creating new model instances

Create and save new objects to database is easy:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var object = {
  name: "Arctic Cirle Ale",
  brewery: "Malmgard",
  brewed_since: 2009,
};

var beer = new Beer(object);
beer.save().then( function() {
  console.log("beer created!");
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
object =
  name: "Arctic Cirle Ale"
  brewery: "Malmgard"
  brewed_since: 2009

beer = new Beer(object)
beer.save().then () ->
  console.log "beer created!"
{% endhighlight %}
</div>

Once the method `save` has been called to the Model instance, the new object is saved to the backing database. And thanks to three way data binding, all the apps who have registered for the changes in collection Beers will get updated with the new data!

## Further reading

Learn more about  Supersonic.data from the [API docs][data-api].

</section>
</section>

[data-api]: /supersonic/api-reference/stable/supersonic/data