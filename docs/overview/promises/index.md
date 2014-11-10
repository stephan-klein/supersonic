---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic utilizes promises
section_id: promises
---

# Promises

Since webviews are an asynchronous platform, the various events happening in the web view such as button clicks, data arriving from the backend etc, are handled in callback functions. Quite often callbacks have to be deeply nested, and this can easily result as an 'callback hell', that makes it hard to follow application logic and troublesome to implement error handling.

A promise is a proxy object for an event that is not necessary happened. A success and failure callback functions can be given to a promise, and once the promise is _resolved_ (i.e. the 'promised' event happens succesfully) or _rejected_ (the 'promised' event fails), the corresponding callback is called.

Most of the Supersonic core API's return a promise. Callback functions can be added to a promise with the method `then`. The first parameter is a success calback that gets called if promise is resolved, the optinonal second parameter is called if promise is rejected (i.e. event is successfull).

In a simple scenario, use of an api that returns promise does not differ much from usage of a api returning a callback. In the following example Supersonic dialog is opened. Dialog returns a promise, that resolves with he user inputed value:

```js
myController = ($scope, supersonic) ->
  labels =
    buttonLabels: ["Yes", "No"]

  supersonic.ui.dialog.confirm("Like Angular?", labels)
  .then (answer) ->
    if ( answer==0 )
      $scope.answer = "Yes"
    else
      $scope.answer = "No"
```

In the following we have a more complicated example, where the program logic calls in succession four Supersonic functions (two calls to dialog and two to load data records from backend), each of which return a promise. Instead of nesting callbacks, the use of promises makes it possible to chain the callbacks so that their execution appears to be sequential. If any of the chained promises is rejected (i.e. some of the events is unsuccesful), the error is propagated to the error handler that is registered to the last promise.

```js
myController = ($scope, supersonic) ->
  Task = supersonic.data.model('task')
  User = supersonic.data.model('user')

  supersonic.ui.dialog.prompt("give task number")
  .then
    (input) -> Task.find(123)
  .then
    (task) -> User.find(task.assignee_id)
  .then
    (user) -> supersonic.ui.dialog.alert "Task was assigned to #{user.name}"
  .then
    () -> supersonic.logger.log "completed",
    (error) -> supersonic.logger.error "something wrong..."

```

## Learn more about promises

 - [https://docs.angularjs.org/api/ng/service/$q](https://docs.angularjs.org/api/ng/service/$q)
 - [https://github.com/kriskowal/q](https://github.com/kriskowal/q)
