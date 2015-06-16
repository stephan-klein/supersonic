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

## Supported Platforms

- Android
- iOS

## Example

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