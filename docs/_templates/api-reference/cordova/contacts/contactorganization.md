---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: ContactOrganization object
section_id: cordova
subsection_id: contacts
method_id: contactorganization
---

# ContactOrganization

The `ContactOrganization` object stores a contact's organization
properties.  A `Contact` object stores one or more
`ContactOrganization` objects in an array.

## Properties

- __pref__: Set to `true` if this `ContactOrganization` contains the user's preferred value. _(boolean)_

- __type__: A string that indicates what type of field this is, _home_ for example. _(DOMString)

- __name__: The name of the organization. _(DOMString)_

- __department__: The department the contract works for. _(DOMString)_

- __title__: The contact's title at the organization. _(DOMString)_


## Supported Platforms

- Android
- iOS

## Example

```javascript
function onSuccess(contacts) {
    for (var i = 0; i < contacts.length; i++) {
        for (var j = 0; j < contacts[i].organizations.length; j++) {
            alert("Pref: "      + contacts[i].organizations[j].pref       + "\n" +
                "Type: "        + contacts[i].organizations[j].type       + "\n" +
                "Name: "        + contacts[i].organizations[j].name       + "\n" +
                "Department: "  + contacts[i].organizations[j].department + "\n" +
                "Title: "       + contacts[i].organizations[j].title);
        }
    }
};

function onError(contactError) {
    alert('onError!');
};

var options = new ContactFindOptions();
options.filter = "";
filter = ["displayName", "organizations"];
navigator.contacts.find(filter, onSuccess, onError, options);
```

## iOS Quirks

- __pref__: Not supported on iOS devices, returning `false`.

- __type__: Not supported on iOS devices, returning `null`.

- __name__: Partially supported.  The first organization name is stored in the iOS __kABPersonOrganizationProperty__ field.

- __department__: Partially supported.  The first department name is stored in the iOS __kABPersonDepartmentProperty__ field.

- __title__: Partially supported.  The first title is stored in the iOS __kABPersonJobTitleProperty__ field.
