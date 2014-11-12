---
layout: guides_architecture
title: Supersonic Documentation
header_sub_title: Learn how to build beautiful mobile apps with the Supersonic UI framework.
parent_id: supersonic
section_id: communication
---
<section class="docs-section" id="communication">
# Sharing data between views in a multi-page application

The Supersonic Multi-Page App architecture differs from Single-Page App architecture in several ways, and sharing data between various parts of your application is one part that requires different techniques. The most important thing to understand is that each `supersonic.ui.view` object you have in your layer stack (or preloaded to memory) is a separate "browser instance", with its own DOM and JavaScript runtime.

This means that you cannot create "global" JavaScript variables, that singletons such as AngularJS services are not unique (since the code is loaded multiple times, once per WebView, and AngularJS maintains the service singleton separately for each ng-app instance), and so on.

However, Supersonic has implemented certain HTML5 standards and other functionalities that overcome these limitations and let you do everything a Single-Page App could do.

## publish subscribe channel

Perhaps the easiest way for cross-view communication is the Supersonic
[publish-subscribe](http://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern) messaging channel.

There can be any number of channels in one app. Each  channel is identified by a string (the channel name). A channel is accessed with the method `supersonic.data.channel('name_of_the_channel')`.

A vebview can _publish_ a message to a channel (called 'public_announcements') as follws:

```js
message =
  sender: "beers#create"
  contet: "a new beer brewed"

supersonic.data.channel('public_announcements').publish(data)
```

Published message can be any JavaScript object. Message is recieved by _all_ the webviews who have _subscribed_ for the same channel by registering a callback function to the channel:

```js
  supersonic.data.channel('public_announcements').subscribe (message) ->
    console.log "recieved a message #{message}"
```

See the [API reference](/api-reference/stable/supersonic/data/channel/)

## superscope

```js
```

```js
```

## view parameters

A frequenly occuring pattern in an app is the need to navigate from the list of a document collection to the page of a single document.

Eg. in the following we have a view that lists all documents in colleciton `beers`. Each of the beer-documents have a id-property that identifies the document. When clicking to an document having id 42, the super-navigate element is used to open the webview `beers#show?id=42`, where `beers#show` identify the webview and rest of the url is a view parameter.

```html
  <ul class="list">
    <super-navigate ng-attr-location="beers#show?id={{ beer.id }}" ng-repeat="beer in beers">
      <li class="item">{{beer.name}}</li>
    </super-navigate>
  </ul>
```

The controller function of view `beers#show` can access the view parameter as follows:

```js
  supersonic.ui.views.current.whenVisible ->
    Beer.find(steroids.view.params.id).then (beer)->
      $scope.beer = beer
  )
```

See the [Fourth mile on Application Architecture][app-architecture-mile] for more.

## window.postMessage

Supersonic implements the `window.postMessage` API to enable communication between different WebViews. The basic usage is simple: a WebView calls the `window.postMessage()` function with a certain message. The message event is broadcasted to all other WebViews, who can receive it by listening to the `window` `message` event.

As an example, we have the following code in `index.html`

```js
function broadcastMessage(msg) {

  message = {
    recipient: "showView",
    message: "Hi Show view!"
  }

  window.postMessage(message);

}
```

And then in `show.html`, which is running in a separate WebView:

```js

function messageReceived(event) {

  // check that the message is intended for us
  if (event.data.recipient == "showView") {
    alert(event.data.message)
  }
}

window.addEventListener("message", messageReceived);
```

The Supersonic usage of `postMessage` is a bit simplified: we do not use the event.origin and `event.source` attributes of the received event, nor do we give a targetOrigin for the `window.postMessage` API call. Since a Supersonic app is is "walled-off" from the general Internet inside the app package, all postMessage calls are automatically posted to every WebView in memory. It is then up to the sender and receiver to ensure that messages are handled by the correct WebViews.

`window.postMessage` is tremendously useful and even necessary for many functionalities of your Multi-Page App – learn to use it well.

## window.localStorage

`window.localStorage` is shared between all WebViews in your app. Thus, an item saved with `localStorage.setItem()` in one WebView (e.g. `index.html`) can be retreived from another WebView (e.g. `show.html`) with `localStorage.getItem()`.

Hint: to save objects to `localStorage`, you can use `JSON.stringify(object)` to convert your object to a String, and then `JSON.parse(object_as_string)` to convert it back to an object.

An important difference to browser apps is that the user won't have access to developer tools for your WebViews. Thus, they cannot manipulate `localStorage` directly – everything you save there remains, even over app updates (of course, cleaning the app cache will empty `localStorage` also).

</section>

[app-architecture-mile]: /supersonic/tutorial/fourth-mile
