---
layout: docs_overview
parent_id: supersonic
section_id: callbacks
---

<section class="docs-section" id="callbacks">
# Callbacks

In addition to [Promises][promises-guide], some asynchronous Supersonic APIs support callback functions. Callbacks are a more traditional way of handling asynchronous execution in JavaScript. A callback is a function that is passed to another function as a parameter, and the execution of the callback happens inside the function that it was passed to.

In Supersonic, callback functions are declared in the __last parameter object__ that is passed to a method. The callback object has two properties: `onSuccess` and `onFailure`. Naturally, the `onSuccess` is executed on successful completion of the parent method, and may receive a result parameter depending on the function being called. `onFailure` is executed when there is an error, and also receives the resulting error as a parameter.

```coffeescript
supersonic.debug.ping({
  onSuccess:function(data){
    console.log(data);
  },
  onFailure:function(error){
    console.log(error);
  }
});
```

When using callbacks, be aware that code execution is not blocked while the asynchronous function is running, so

```coffeescript
var reply = "Not ready!"

supersonic.debug.ping({
  onSuccess:function(data){
    reply = data
  },
  onFailure:function(error){
    console.log(error)
  }
});

supersonic.ui.dialog.alert(reply);
```

will alert "Not ready!", because the `onSuccess` callback has not yet been executed.

</section>

[promises-guide]: /supersonic/guides/technical-concepts/promises