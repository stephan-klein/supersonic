---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: navigator.contacts.pickContact
section_id: cordova
subsection_id: contacts
method_id: pickcontact
---

# contacts.pickContact

The `navigator.contacts.pickContact` method launches the Contact Picker to select a single contact.
The resulting object is passed to the `contactSuccess` callback
function specified by the __contactSuccess__ parameter.

## Parameters

- __contactSuccess__: Success callback function invoked with the single Contact object. [Required]

- __contactError__: Error callback function, invoked when an error occurs. [Optional]

## Example

```javascript
navigator.contacts.pickContact(function(contact){
        console.log('The following contact has been selected:' + JSON.stringify(contact));
    },function(err){
        console.log('Error: ' + err);
    });
```
