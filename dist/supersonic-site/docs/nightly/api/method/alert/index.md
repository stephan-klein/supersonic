---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/alert/"

title: "alert"
header_sub_title: "Method in module notification"
doc: "alert"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L8930'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L8930'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  alert



</h1>





Shows a native alert box.









## Usage
```coffeescript
# Shorthand
supersonic.notification.alert("You are awesome!")

# Verbose
options =
  title: "Custom Title"
  message: "I'm an alert!"
  buttonLabel: "Close"
supersonic.notification.alert(options)
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
        message
        
        
      </td>
      <td>
        
  <code>string</code>
      </td>
      <td>
        <p>alert message (shorthand).</p>

        
      </td>
    </tr>
    
    <tr>
      <td>
        options
        
        
      </td>
      <td>
        
  <code>Object</code>
      </td>
      <td>
        <p>an options object (verbose). The following properties are available:</p>
<ul>
<li><code>message</code>: alert message</li>
<li><code>title</code>: alert title (optional, defaults to &quot;Alert&quot;)</li>
<li><code>buttonName</code>: button name (optional, defaults to &quot;OK&quot;)</li>
</ul>

        
      </td>
    </tr>
    
  </tbody>
</table>

    

    <h3>Returns</h3>

  <code>Promise</code> Promise that is resolved when the the button in the alert box is tapped.


  
  
  







  






