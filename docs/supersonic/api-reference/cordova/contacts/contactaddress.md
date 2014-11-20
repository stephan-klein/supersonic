---
layout: "docs_api"
title: Supersonic API reference
header_sub_title: Contact object
section_id: cordova
subsection_id: contacts
---

# ContactAddress

The `ContactAddress` object stores the properties of a single address
of a contact.  A `Contact` object may include more than one address in
a `ContactAddress[]` array.


## Properties

- __pref__: Set to `true` if this `ContactAddress` contains the user's preferred value. _(boolean)_

- __type__: A string indicating what type of field this is, _home_ for example. _(DOMString)_

- __formatted__: The full address formatted for display. _(DOMString)_

- __streetAddress__: The full street address. _(DOMString)_

- __locality__: The city or locality. _(DOMString)_

- __region__: The state or region. _(DOMString)_

- __postalCode__: The zip code or postal code. _(DOMString)_

- __country__: The country name. _(DOMString)_

## Example

```javascript
// display the address information for all contacts

function onSuccess(contacts) {
    for (var i = 0; i < contacts.length; i++) {
        for (var j = 0; j < contacts[i].addresses.length; j++) {
            alert("Pref: "         + contacts[i].addresses[j].pref          + "\n" +
                "Type: "           + contacts[i].addresses[j].type          + "\n" +
                "Formatted: "      + contacts[i].addresses[j].formatted     + "\n" +
                "Street Address: " + contacts[i].addresses[j].streetAddress + "\n" +
                "Locality: "       + contacts[i].addresses[j].locality      + "\n" +
                "Region: "         + contacts[i].addresses[j].region        + "\n" +
                "Postal Code: "    + contacts[i].addresses[j].postalCode    + "\n" +
                "Country: "        + contacts[i].addresses[j].country);
        }
    }
};

function onError(contactError) {
    alert('onError!');
};

// find all contacts
var options = new ContactFindOptions();
options.filter = "";
var filter = ["displayName", "addresses"];
navigator.contacts.find(filter, onSuccess, onError, options);
```

## iOS Quirks

- __pref__: Not supported on iOS devices, returning `false`.

- __formatted__: Currently not supported.
