---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic integrates with AngularJS
parent_id: supersonic
section_id: angular-js
---
<section class="ag__docs__content">

<section class="docs-section" id="angular-js">
# Angular.JS

[Angular JS](https://angularjs.org/) is an open source Javascript MVC-framework developed and maintained by Google. Angular allows a declarative style of UI building by making it possible to extend the HTML vocabulary. Angular makes it easy to build modularized applications, where DOM manipulation is fully separated from application logic. This results in code that is easily testable and extendable.

Perhaps the most famous feature of Angular is the _two-way data binding_
that makes it extremely easy to keep views in sync with data in the controller. Controller functions get access to view through a special Angular service called `$scope` that can be injected to any controller:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
var myController = function($scope) {
  $scope.text = "World!";
};
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
myController = ($scope) ->
  $scope.text = "World!"
{% endhighlight %}
</div>

An HTML view can then render the value of a variable in `$scope` by using the 'double mustache' syntax:


```html
{% raw %}
<h1>Hello {{text}}</h1>
{% endraw %}
```

Varibales in `$scope` can also be _bound_ to form controls such as a text input field: when the user types text into the field, the associated `$scope` variable (such as `$scope.inputText`) gets updated in all controllers and thus propagated to all views that use it.

## Supersonic AngularJS Service

Despite being framework agnostic, Supersonic has been built to be fully compatible with Angular JS. In particular, this means that within all the callback functions of various Supersonic API services, one can directly update the application `$scope`:

<div class="clearfix">
  <div class="btn-group btn-group-xs pull-right" role="group" style="margin-top: 20px;">
    <button type="button" data-role="type-switch" data-type="js" class="btn btn-primary active">JavaScript</button>
    <button type="button" data-role="type-switch" data-type="coffee" class="btn btn-default">CoffeeScript</button>
  </div>
</div>

<div data-role="example-code" data-type="js">
{% highlight javascript %}
// Note that the "supersonic" Angular service is injected
// into the controller
var myController = function($scope, supersonic) {
  var labels = {
    buttonLabels: ["Yes", "No"]
  };

  supersonic.ui.dialog.confirm("Like Angular?", labels).then( function(answer) {
    if ( answer===0 ) {
      $scope.answer = "Yes";
    }
    else {
      $scope.answer = "No";
    }
  });
};
{% endhighlight %}
</div>

<div data-role="example-code" data-type="coffee" style="display: none;">
{% highlight coffeescript %}
# Note that the "supersonic" Angular service is injected
# into the controller
myController = ($scope, supersonic) ->
  labels =
    buttonLabels: ["Yes", "No"]

  supersonic.ui.dialog.confirm("Like Angular?", labels).then (answer) ->
    if ( answer==0 )
      $scope.answer = "Yes"
    else
      $scope.answer = "No"
{% endhighlight %}
</div>

Without the `supersonic` Angular Service, you need to explicitly ask Angular to run the `$digest`-loop (which propagates updates to `$scope` to the whole app) by calling `$scope.$apply()`.

Note that some `supersonic.*` functions, such as those using [streams](/supersonic/guides/technical-concepts/streams) still require a manual `$scope.$apply()`.

## Learn more

Learn more about Angular:

 - [Angular tutorial](https://docs.angularjs.org/tutorial)
 - [learn-angular.org](http://www.learn-angular.org/)
 - [Egghead.io](https://egghead.io/technologies/angularjs/)

</section>

</section>
