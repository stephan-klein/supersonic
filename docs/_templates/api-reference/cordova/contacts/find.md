---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: navigator.contacts.find
section_id: cordova
subsection_id: contacts
method_id: find
---

# contacts.find

The `navigator.contacts.find` method executes asynchronously, querying the
device contacts database and returning an array of `Contact` objects.
The resulting objects are passed to the `contactSuccess` callback
function specified by the __contactSuccess__ parameter.

The __contactFields__ parameter specifies the fields to be returned.  A zero-length __contactFields__ parameter is invalid and results in
`ContactError.INVALID_ARGUMENT_ERROR`. A __contactFields__ value of
`"*"` returns all contact fields.

The __contactFindOptions.filter__ string can be used as a search
filter when querying the contacts database.  If provided, a
case-insensitive, partial value match is applied to each field
specified in the __contactFields__ parameter.  If there's a match for
_any_ of the specified fields, the contact is returned.

- __contactFields__: Contact fields to use as a search qualifier. _(DOMString[])_ [Required]

- __contactSuccess__: Success callback function invoked with the array of Contact objects returned from the database. [Required]

- __contactError__: Error callback function, invoked when an error occurs. [Optional]

- __contactFindOptions__: Search options to filter navigator.contacts. [Optional] Keys include:

    - __filter__: The search string used to find navigator.contacts. _(DOMString)_ (Default: `""`)

    - __multiple__: Determines if the find operation returns multiple navigator.contacts. _(Boolean)_ (Default: `false`)

## Example

```javascript
function onSuccess(contacts) {
    alert('Found ' + contacts.length + ' contacts.');
};

function onError(contactError) {
    alert('onError!');
};

// find all contacts with 'Bob' in any name field
var options      = new ContactFindOptions();
options.filter   = "Bob";
options.multiple = true;
var fields       = ["displayName", "name"];
navigator.contacts.find(fields, onSuccess, onError, options);
```
