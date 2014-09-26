---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/confirm/"

title: "confirm"
header_sub_title: "Method in module notification"
doc: "confirm"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L8976'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L8976'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  confirm



</h1>





Shows a native confirm dialog.









## Usage
```coffeescript
# Shorthand
supersonic.notification.confirm("You are awesome!")

# Verbose
options =
  title: "Custom Title"
  message: "I'm a confirm!"
  buttonLabels: ["Yes", "Close"]
supersonic.notification.confirm(options)
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
        <p>confirm message (shorthand).</p>

        
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
<li><code>message</code>: confirm message</li>
<li><code>title</code>: confirm title (optional, defaults to &quot;Confirm&quot;)</li>
<li><code>buttonLabels</code>: Array of strings specifying button labels (optional, defaults to [&quot;OK&quot;,&quot;Cancel&quot;]).</li>
</ul>

        
      </td>
    </tr>
    
  </tbody>
</table>

    

    <h3>Returns</h3>

  <code>Promise</code> Promise that is resolved with the index of the tapped button as an argument.


  
  
  







  






