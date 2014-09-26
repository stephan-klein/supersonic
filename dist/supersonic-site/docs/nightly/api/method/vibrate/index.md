---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/vibrate/"

title: "vibrate"
header_sub_title: "Method in module notification"
doc: "vibrate"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L9100'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L9100'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  vibrate



</h1>





Vibrates the device for the specified amount of time.









## Usage
```coffeescript
supersonic.notification.vibrate(2500)
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
    
    <tr>
      <td>
        time
        
        
      </td>
      <td>
        
  <code>Number</code>
      </td>
      <td>
        <p>time in illiseconds to vibrate the device. Please note: iOS ignores the time parameter and always vibrates for a pre-set amount of time.</p>

        
      </td>
    </tr>
    
  </tbody>
</table>

    

    <h3>Returns</h3>

  <code>Promise</code> Promise that is resolved when the native side has vibrated.


  
  
  







  






