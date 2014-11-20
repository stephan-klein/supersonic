---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: ContactFindOptions object
section_id: cordova
subsection_id: contacts
method_id: contactfindoptions
---

# ContactFindOptions

Contains properties that can be used to filter the results of a `contacts.find` operation.

## Properties

- __filter__: The search string used to find navigator.contacts. _(DOMString)_ (Default: `""`)

- __multiple__: Determines if the find operation returns multiple navigator.contacts. _(Boolean)_ (Default: `false`)

## Example

```javascript
// success callback
function onSuccess(contacts) {
    for (var i=0; i<contacts.length; i++) {
        alert(contacts[i].displayName);
    }
};

// error callback
function onError(contactError) {
    alert('onError!');
};

// specify contact search criteria
var options = new ContactFindOptions();
    options.filter="";        // empty search string returns all contacts
    options.multiple=true;    // return multiple results
    filter = ["displayName"]; // return contact.displayName field

    // find contacts
navigator.contacts.find(filter, onSuccess, onError, options);
```
