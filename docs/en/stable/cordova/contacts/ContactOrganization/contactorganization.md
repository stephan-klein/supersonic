---
 license: Licensed to the Apache Software Foundation (ASF) under one
         or more contributor license agreements.  See the NOTICE file
         distributed with this work for additional information
         regarding copyright ownership.  The ASF licenses this file
         to you under the Apache License, Version 2.0 (the
         "License"); you may not use this file except in compliance
         with the License.  You may obtain a copy of the License at

           http://www.apache.org/licenses/LICENSE-2.0

         Unless required by applicable law or agreed to in writing,
         software distributed under the License is distributed on an
         "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
         KIND, either express or implied.  See the License for the
         specific language governing permissions and limitations
         under the License.
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

## Android 2.X Quirks

- __pref__: Not supported by Android 2.X devices, returning `false`.

## iOS Quirks

- __pref__: Not supported on iOS devices, returning `false`.

- __type__: Not supported on iOS devices, returning `null`.

- __name__: Partially supported.  The first organization name is stored in the iOS __kABPersonOrganizationProperty__ field.

- __department__: Partially supported.  The first department name is stored in the iOS __kABPersonDepartmentProperty__ field.

- __title__: Partially supported.  The first title is stored in the iOS __kABPersonJobTitleProperty__ field.