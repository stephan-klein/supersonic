---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: ContactField object
section_id: cordova
subsection_id: contacts
method_id: contactfield
---

# ContactField

The `ContactField` object is a reusable component that represents
contact fields generically.  Each `ContactField` object contains a
`value`, `type`, and `pref` property.  A `Contact` object stores
several properties in `ContactField[]` arrays, such as phone numbers
and email addresses.

In most instances, there are no pre-determined values for a
`ContactField` object's __type__ attribute.  For example, a phone
number can specify __type__ values of _home_, _work_, _mobile_,
_iPhone_, or any other value that is supported by a particular device
platform's contact database.  However, for the `Contact` __photos__
field, the __type__ field indicates the format of the returned image:
__url__ when the __value__ attribute contains a URL to the photo
image, or _base64_ when the __value__ contains a base64-encoded image
string.

## Properties

- __type__: A string that indicates what type of field this is, _home_ for example. _(DOMString)_

- __value__: The value of the field, such as a phone number or email address. _(DOMString)_

## Example

```javascript
// create a new contact
var contact = navigator.contacts.create();

// store contact phone numbers in ContactField[]
var phoneNumbers = [];
phoneNumbers[0] = new ContactField('work', '212-555-1234');
phoneNumbers[1] = new ContactField('mobile', '917-555-5432');
phoneNumbers[2] = new ContactField('home', '203-555-7890');
contact.phoneNumbers = phoneNumbers;

// save the contact
contact.save();
```
