---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/ping/"

title: "ping"
header_sub_title: "Method in module debug"
doc: "ping"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L8693'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L8693'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  ping



</h1>





Pings the native runtime.









## Usage
```coffeescript
supersonic.debug.ping().then (response) ->
  supersonic.logger.log response
```


  
    

    
<table class="table" style="margin:0;">
  <thead>
    <tr>
      <th>Param</th>
      <th>Type</th>
      <th>Details</th>
    </tr>
  </thead>
  <tbody>
    
  </tbody>
</table>

    

    <h3>Returns</h3>

  <code>Promise</code> A promise that gets resolved once the ping is successful. Resolves with the string `"Pong!"`.


  
  
  







  






