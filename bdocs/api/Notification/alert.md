---
layout: "docs_api"
version: "page.method"
versionHref: "/docs"
path: "notification/alert/"

title: "Alert"
header_sub_title: ""
---

{% assign method = site.data.notification.alert %}

[View Source]({{method.source_link}})


# alert

The `{{method.api_call}}` API call will ping the native side. After the ping returns, the promise is resolved with the string `Pong!`.


## Usage
```coffeescript
supersonic.ping.then (response) ->
  console.log response # logs "Pong!"
```

## Usage with AngularJS

```coffeescript
angular.module('PingApp', ['supersonic'])
.controller 'PingAppCtrl', ($scope, supersonic) ->
  $scope.pongs = 0
  $scope.ping = () ->
    supersonic.ping.then ->
      $scope.pongs++
```

## Params
{% for param in method.params %}
  {{param.name}}
{% endfor %}
