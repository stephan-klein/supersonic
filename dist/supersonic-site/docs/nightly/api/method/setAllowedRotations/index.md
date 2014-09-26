---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/setAllowedRotations/"

title: "setAllowedRotations"
header_sub_title: "Method in module screen"
doc: "setAllowedRotations"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L9157'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L9157'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  setAllowedRotations



</h1>





Determine which of the four possible screen rotations are enabled on your device. By default all rotations are allowed, with the exception of custom builds where the build settings have been used to lock the app into a certain rotation scheme. Modals are not affected by setting allowed rotations in other views and conversely setting allowed rotations in a modal does not affect the rest of the app.









## Usage
```coffeescript
# Shorthand:
supersonic.ui.screen.setAllowedRotations(["landscapeLeft"])
# Verbose:
options =
 orientations: ["portrait", "portraitUpsideDown", "landscapeLeft", "landscapeRight"]
supersonic.ui.screen.setAllowedRotations(options)
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

  <code>Promise</code> Promise that is resolved when the allowed rotations are set.


  
  
  







  






