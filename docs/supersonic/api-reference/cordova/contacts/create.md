---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: navigator.contacts.create
section_id: cordova
subsection_id: contacts
method_id: create
---

# contacts.create

The `navigator.contacts.create` method is synchronous, and returns a new `Contact` object.

This method does not retain the Contact object in the device contacts
database, for which you need to invoke the `Contact.save` method.

## Description

The `contacts.create` method is synchronous, and returns a new `Contact` object.

This method does not retain the Contact object in the device contacts
database, for which you need to invoke the `Contact.save` method.

## Example

```javascript
var myContact = navigator.contacts.create({"displayName": "Test User"});
```
