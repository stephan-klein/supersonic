---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/openURL/"

title: "openURL"
header_sub_title: "Method in module app"
doc: "openURL"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L8484'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L8484'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  openURL



</h1>





Launches browser to open the URL or any external application with that applications URL scheme.









## Usage
```coffeescript
supersonic.app.openURL("http://www.google.com")
supersonic.app.openURL("otherapp://?foo=1&bar=2")
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
        URL
        
        
      </td>
      <td>
        
  <code>string</code>
      </td>
      <td>
        <p>to open. URLs starting with &quot;http(s)://&quot; will be opened in the device&#39;s browser.</p>

        
      </td>
    </tr>
    
  </tbody>
</table>

    

    <h3>Returns</h3>

  <code>Promise</code> Promise that is resolved when the application is resumed.


  
  
  







  






