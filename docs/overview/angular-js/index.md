---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic integrates with AngularJS
section_id: angular-js
---

## Angular.JS

[Angular JS](https://angularjs.org/) is an open source Javascript MVC-framework developed and maintained by Google. Angular allows a declarative style of building the UI by providing means to extend HTML vocabulary. Angular provides means to build modularized applications where the DOM manipulations fully separated from application logic. This results code that is easily testable and extendable.

Perhaps the most famous feature of Angular is the _two-way data binding_
that makes extremely easy to keep view layer and data in synch. Controller functions get access to view through a special Angular service called `$scope` that can be injected to any controller:

```js
myController = ($scope) ->
  $scope.text = "World!"
```

A HTML view can then render the value of a variable in `$scope` by using the double mustache -syntax:

```html
<h1>Hello { {text}}</h1>
```

Varibales in `$scope` can also be bound to form controls such as an input field, and all the changes in data caused by the user typing to the form would be propagated to controllers and other parts of view.

## Supersonic service

Despite being framework agnostic Supersonic has been built to be fully compatible with Angular JS. In particular, this means that within all the handler functions of various Supersonic API services one can directly update the application `$scope`:

```js
myController = ($scope, supersonic) ->
  labels =
    buttonLabels: ["Yes", "No"]

  supersonic.ui.dialog.confirm("Like Angular?", labels).then (answer) ->
    if ( answer==0 )
      $scope.answer = "Yes"
    else
      $scope.answer = "No"
```

In a nonangularized environment one should explicitly ask Angular to run the $digest-loop in order to get model updates propagated to the whole app.

## Learn more

Learn more about Angular:

 - [Angular tutorial](https://docs.angularjs.org/tutorial)
 - [Egghead.io](https://egghead.io/technologies/angularjs/)