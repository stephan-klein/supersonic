---
layout: "docs_api"
version: "nightly"
versionHref: "/docs/nightly"
path: "api/method/prompt/"

title: "prompt"
header_sub_title: "Method in module notification"
doc: "prompt"
docType: "method"
---

<div class="improve-docs">
  <a href='http://github.com/driftyco/ionic/tree/master/dist/supersonic.js#L9040'>
    View Source
  </a>
  &nbsp;
  <a href='http://github.com/driftyco/ionic/edit/master/dist/supersonic.js#L9040'>
    Improve this doc
  </a>
</div>




<h1 class="api-title">

  prompt



</h1>





Shows a native prompt dialog.









## Usage
```coffeescript
# Shorthand
supersonic.notification.prompt("This is a prompt. Type something")

# Verbose
options =
  title: "Custom Title"
  message: "I'm a prompt!"
  buttonLabels: ["Yes", "No", "Cancel"]
  defaultText: "Type here"
supersonic.notification.prompt(options)
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
        <p>confirm dialog (shorthand).</p>

        
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
<li><code>title</code>: dialog title (optional, defaults to &quot;Confirm&quot;)</li>
<li><code>buttonLabels</code>: array of strings specifying button labels (optional, defaults to [&quot;OK&quot;,&quot;Cancel&quot;]).</li>
<li><code>defaultText</code>: default textbox input value (optional, defaults to an empty string)</li>
</ul>

        
      </td>
    </tr>
    
  </tbody>
</table>

    

    <h3>Returns</h3>

  <code>Promise</code> Promise that is resolved with an object as an argument. The argument object has the following properties:
* `buttonIndex`: index of the pressed button
* `input`: input string


  
  
  







  






