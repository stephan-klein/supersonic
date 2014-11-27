---
layout: guides_architecture
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: communication
---
<section class="ag__docs__content">
<section class="docs-section" id="sharing-data-in-a-mpa">

## Sharing data between views in a multi-page application

The Supersonic Multi-Page App architecture differs from Single-Page App architecture in several ways, and sharing data between various parts of your application is one part that requires different techniques. The most important thing to understand is that each `supersonic.ui.View` object you have in your layer stack (or preloaded to memory) is a separate "browser instance", with its own DOM and JavaScript runtime.

This means that you cannot create "global" JavaScript variables, that singletons such as AngularJS services are not unique (since the code is loaded multiple times, once per WebView, and AngularJS maintains the service singleton separately for each ng-app instance), and so on.

However, Supersonic has implemented certain ways that overcome these limitations and let you do everything a Single-Page App could do. There various techniques for cross-view communication so you can certainly find a fitting solution for all your use cases!

</section>
<section class="docs-section" id="publish-subscribe-channel">

## Publish-subscribe channel

Perhaps the easiest way for cross-view communication is the Supersonic
[publish-subscribe](http://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) messaging channel.

There can be any number of channels in one app. Each  channel is identified by a string (the channel name). A channel is accessed with the method `supersonic.data.channel('name_of_the_channel')`.

A WebView can _publish_ a message to a channel (called 'public_announcements') as follows:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var message = {
  sender: "beers#create",
  contet: "a new beer brewed"
};

supersonic.data.channel('public_announcements').publish(message);
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
message =
  sender: "beers#create"
  contet: "a new beer brewed"

supersonic.data.channel('public_announcements').publish(message)    
{% endhighlight %}
</div>

Published message can be any JavaScript object. Message is recieved by _all_ the WebViews who have _subscribed_ for the same channel by registering a callback function:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>
<div data-role="example-code" data-type="js">
{% highlight javascript %}
supersonic.data.channel('public_announcements').subscribe( function(message) {
  console.log("received a message " + message);
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
supersonic.data.channel('public_announcements').subscribe (message) ->
  console.log "received a message #{message}"
{% endhighlight %}
</div>

See the [API reference](/supersonic/api-reference/stable/supersonic/data/channel/)

</section>
<section class="docs-section" id="superscope">

## Superscope

It is extremely easy to keep the rendered view and model data in sync by utilizing Angular's two-way data binding. If you have a variable `message` in Angular scope, you could e.g. bind the variable to be rendered in DOM _and_ to an input field:

```html
{% raw %}
<div ng-controller="FirstController">
  <h3>write here text</h3>

  <input ng-model="message"/>

  <h3>you wrote</h3>

  <div>
    {{message}}
  </div>
</div>
{% endraw %}
```

If one types text to the input field, the text is automatically rendered within the div as it is typed.  Controller can get hold of the typed data through scope variable `$scope.message`.

However the Angular two-way data binding works only within one WebView. If you have another WebView with the following template, it does not get updated when data changes in the first WebView:

```html
{% raw %}
<div ng-controller="SecondController">
  <h3>text from other webview</h3>

  <div>
    {{message}}
  </div>
</div>
{% endraw %}
```

Supersonic provides _superscope_ which makes it possible to keep sync variables within two or more different WebViews.

You bind a variable in the local scope of the first WebView to the superscope as follows:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>
<div data-role="example-code" data-type="js">
{% highlight javascript %}
angular
  .module('first')
  .controller('FirstController', function($scope, supersonic) {
    // initialize the variable in local scope
    $scope.message = null;

    // bind it to superscope
    supersonic.bind($scope, "message");
  });
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
angular
  .module('first')
  .controller 'FirstController', ($scope, supersonic) ->
    # initialize the variable in local scope
    $scope.message = null

    # bind it to superscope
    supersonic.bind $scope, "message"
{% endhighlight %}
</div>

Same should be done in the controller of the second WebView:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>
<div data-role="example-code" data-type="js">
{% highlight javascript %}
angular
  .module('second')
  .controller('SecondController', function($scope, supersonic) {
    $scope.message = null;
    supersonic.bind($scope, "message");
  });
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
angular
  .module('second')
  .controller 'SecondController', ($scope, supersonic) ->
    $scope.message = null
    supersonic.bind $scope, "message"
{% endhighlight %}
</div>

Now the variable `message` in the both WebViews is kept in synch thanks to superscope!


</section>
<section class="docs-section" id="view-parameters">

## View parameters

A frequenly occuring pattern in an app is the need to navigate from the list of a document collection to the view of a single document.

Eg. in the following we have a WebView that lists all documents in colleciton `beers`. Each of the beers have property `id` that identifies the document. When clicking to an document having id 42, the [super-navigate](/supersonic/api-reference/stable/components/super-navbar/) element is used to open the WebView `beers#show?id=42`, where `beers#show` identifies the WebView and rest of the url is a view parameter.

```html
<ul class="list">
  <super-navigate ng-attr-location="beers#show?id={{ beer.id }}" ng-repeat="beer in beers">
    <li class="item">{{beer.name}}</li>
  </super-navigate>
</ul>
```

The controller function of WebView `beers#show` can access the view parameter using `steroids.view.params`:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>
<div data-role="example-code" data-type="js">
{% highlight javascript %}
supersonic.ui.views.current.whenVisible( function(){
  var beer_id = steroids.view.params.id;

  Beer.find(beer_id).then( function(beer){
    $scope.beer = beer;
  }
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
supersonic.ui.views.current.whenVisible ->
  beer_id = steroids.view.params.id

  Beer.find(beer_id).then (beer)->
    $scope.beer = beer
)
{% endhighlight %}
</div>

Now the controller can load the corresponding object form database using [supersonic data](/supersonic/api-reference/stable/supersonic/data/model/model-class/).

</section>
<section class="docs-section" id="postmessage">

## window.postMessage

If any of the above presented higher level API's that Supersonic provides do not match to your usecase, there are still a pair of more lower abstraction level mechanisms for cross-view communication.

Supersonic implements the [window.postMessage API](https://developer.mozilla.org/en-US/docs/Web/API/Window.postMessage) to enable communication between different WebViews. The basic usage is simple: a WebView calls the `window.postMessage()` function with a certain message. The message event is broadcasted to all other WebViews, who can receive it by listening to the `window` `message` event.

As an example, we have the following code in one WebView:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>
<div data-role="example-code" data-type="js">
{% highlight javascript %}
broadcastMessage( function(msg){

  var message = {
    recipient: "showView",
    message: "Hi Show view!"
  };

  window.postMessage(message);
});
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
broadcastMessage (msg) ->

  message =
    recipient: "showView"
    message: "Hi Show view!"

  window.postMessage message
{% endhighlight %}
</div>

And then the following in another webview:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>
<div data-role="example-code" data-type="js">
{% highlight javascript %}
function messageReceived(event) {

  // check that the message is intended for us
  if (event.data.recipient === "showView") {
    alert(event.data.message);
  }
}
window.addEventListener("message", messageReceived);
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
messageReceived = (event) ->

  # check that the message is intended for us
  if event.data.recipient == "showView"
    alert(event.data.message)

window.addEventListener "message", messageReceived
{% endhighlight %}
</div>


The Supersonic usage of `postMessage` is a bit simplified: we do not use the `event.origin` and `event.source` attributes of the received event, nor do we give a `targetOrigin` for the `window.postMessage` API call. Since a Supersonic app is is "walled-off" from the general Internet inside the app package, all postMessage calls are automatically posted to every WebView in memory. It is then up to the sender and receiver to ensure that messages are handled by the correct WebViews.

</section>
<section class="docs-section" id="localstorage">

## window.localStorage

[window.localStorage](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage#localStorage) is shared between all WebViews in your app. Thus, an item saved with `localStorage.setItem()` in one WebView  can be retreived from another WebView  with `localStorage.getItem()`.

Hint: to save objects to `localStorage`, you can use `JSON.stringify(object)` to convert your object to a String, and then `JSON.parse(object_as_string)` to convert it back to an object.

An important difference to browser apps is that the user won't have access to developer tools for your WebViews. Thus, they cannot manipulate `localStorage` directly – everything you save there remains, even over app updates (of course, cleaning the app cache will empty `localStorage` also).

</section>
</section>

[app-architecture-mile]: /supersonic/tutorial/fourth-mile
