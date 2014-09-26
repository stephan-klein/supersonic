---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/rotateTo/"

title: "rotateTo"
header_sub_title: "Method in module screen"
doc: "rotateTo"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L9189'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L9189'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  rotateTo



</h1>





Rotate the screen to one of the four preset orientations. Allowed rotations must be set with `supersonic.ui.screen.setAllowedRotations`, or the call to supersonic.ui.screen.rotate will fail.









## Usage
```coffeescript
# Shorthand
supersonic.ui.screen.rotateTo("landscapeLeft")
#Verbose
options =
 orientation: "landscapeLeft"
supersonic.ui.screen.rotateTo(options)
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

  <code>Promise</code> Promise that is resolved when the screen is rotated.


  
  
  







  






