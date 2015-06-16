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

# ContactName

Contains different kinds of information about a `Contact` object's name.

## Properties

- __formatted__: The complete name of the contact. _(DOMString)_

- __familyName__: The contact's family name. _(DOMString)_

- __givenName__: The contact's given name. _(DOMString)_

- __middleName__: The contact's middle name. _(DOMString)_

- __honorificPrefix__: The contact's prefix (example _Mr._ or _Dr._) _(DOMString)_

- __honorificSuffix__: The contact's suffix (example _Esq._). _(DOMString)_

## Supported Platforms

- Android 2.X
- iOS

## Example

    function onSuccess(contacts) {
        for (var i = 0; i < contacts.length; i++) {
            alert("Formatted: "  + contacts[i].name.formatted       + "\n" +
                "Family Name: "  + contacts[i].name.familyName      + "\n" +
                "Given Name: "   + contacts[i].name.givenName       + "\n" +
                "Middle Name: "  + contacts[i].name.middleName      + "\n" +
                "Suffix: "       + contacts[i].name.honorificSuffix + "\n" +
                "Prefix: "       + contacts[i].name.honorificSuffix);
        }
    };

    function onError(contactError) {
        alert('onError!');
    };

    var options = new ContactFindOptions();
    options.filter = "";
    filter = ["displayName", "name"];
    navigator.contacts.find(filter, onSuccess, onError, options);

## Android Quirks

- __formatted__: Partially supported, and read-only.  Returns a concatenation of `honorificPrefix`, `givenName`, `middleName`, `familyName`, and `honorificSuffix`.

## iOS Quirks

- __formatted__: Partially supported.  Returns iOS Composite Name, but is read-only.