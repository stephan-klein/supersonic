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

# Contact

Contains properties that describe a contact, such as a user's personal or business contact.

## Properties

- __id__: A globally unique identifier. _(DOMString)_

- __displayName__: The name of this Contact, suitable for display to end-users. _(DOMString)_

- __name__: An object containing all components of a persons name. _(ContactName)_

- __nickname__: A casual name by which to address the contact. _(DOMString)_

- __phoneNumbers__: An array of all the contact's phone numbers. _(ContactField[])_

- __emails__: An array of all the contact's email addresses. _(ContactField[])_

- __addresses__: An array of all the contact's addresses. _(ContactAddress[])_

- __ims__: An array of all the contact's IM addresses. _(ContactField[])_

- __organizations__: An array of all the contact's organizations. _(ContactOrganization[])_

- __birthday__: The birthday of the contact. _(Date)_

- __note__: A note about the contact. _(DOMString)_

- __photos__: An array of the contact's photos. _(ContactField[])_

- __categories__:  An array of all the user-defined categories associated with the contact. _(ContactField[])_

- __urls__:  An array of web pages associated with the contact. _(ContactField[])_

## Methods

- __clone__: Returns a new `Contact` object that is a deep copy of the calling object, with the `id` property set to `null`.

- __remove__: Removes the contact from the device contacts database, otherwise executes an error callback with a `ContactError` object.

- __save__: Saves a new contact to the device contacts database, or updates an existing contact if a contact with the same __id__ already exists.

## Details

The `Contact` object represents a user's contact.  Contacts can be
created, stored, or removed from the device contacts database.
Contacts can also be retrieved (individually or in bulk) from the
database by invoking the `contacts.find` method.

__NOTE:__ Not all of the contact fields listed above are supported on
every device platform.  Please check each platform's _Quirks_ section
for details.

## Save Quick Example

    function onSuccess(contact) {
        alert("Save Success");
    };

    function onError(contactError) {
        alert("Error = " + contactError.code);
    };

    // create a new contact object
    var contact = navigator.contacts.create();
    contact.displayName = "Plumber";
    contact.nickname = "Plumber";            // specify both to support all devices

    // populate some fields
    var name = new ContactName();
    name.givenName = "Jane";
    name.familyName = "Doe";
    contact.name = name;

    // save to device
    contact.save(onSuccess,onError);

## Clone Quick Example

        // clone the contact object
        var clone = contact.clone();
        clone.name.givenName = "John";
        console.log("Original contact name = " + contact.name.givenName);
        console.log("Cloned contact name = " + clone.name.givenName);

## Remove Quick Example

    function onSuccess() {
        alert("Removal Success");
    };

    function onError(contactError) {
        alert("Error = " + contactError.code);
    };

        // remove the contact from the device
        contact.remove(onSuccess,onError);

## Full Example

    <!DOCTYPE html>
    <html>
      <head>
        <title>Contact Example</title>

        <script type="text/javascript" charset="utf-8" src="/cordova.js"></script>
        <script type="text/javascript" charset="utf-8" src="/components/steroids-js/steroids.js"></script>
        <script type="text/javascript" charset="utf-8">

        // Wait for device API libraries to load
        //
        document.addEventListener("deviceready", onDeviceReady, false);

        // device APIs are available
        //
        function onDeviceReady() {
            // create
            var contact = navigator.contacts.create();
            contact.displayName = "Plumber";
            contact.nickname = "Plumber";                 // specify both to support all devices
            var name = new ContactName();
            name.givenName = "Jane";
            name.familyName = "Doe";
            contact.name = name;

            // save
            contact.save(onSaveSuccess,onSaveError);

            // clone
            var clone = contact.clone();
            clone.name.givenName = "John";
            console.log("Original contact name = " + contact.name.givenName);
            console.log("Cloned contact name = " + clone.name.givenName);

            // remove
            contact.remove(onRemoveSuccess,onRemoveError);
        }

        // onSaveSuccess: Get a snapshot of the current contacts
        //
        function onSaveSuccess(contact) {
            alert("Save Success");
        }

        // onSaveError: Failed to get the contacts
        //
        function onSaveError(contactError) {
            alert("Error = " + contactError.code);
        }

        // onRemoveSuccess: Get a snapshot of the current contacts
        //
        function onRemoveSuccess(contacts) {
            alert("Removal Success");
        }

        // onRemoveError: Failed to get the contacts
        //
        function onRemoveError(contactError) {
            alert("Error = " + contactError.code);
        }

        </script>
      </head>
      <body>
        <h1>Example</h1>
        <p>Find Contacts</p>
      </body>
    </html>

## Android 2.X Quirks

- __categories__:  Not supported on Android 2.X devices, returning `null`.

## iOS Quirks

- __displayName__: Not supported on iOS, returning `null` unless there is no `ContactName` specified, in which case it returns the composite name, __nickname__ or `""`, respectively.

- __birthday__: Must be input as a JavaScript `Date` object, the same way it is returned.

- __photos__: Returns a File URL to the image, which is stored in the application's temporary directory.  Contents of the temporary directory are removed when the application exits.

- __categories__:  This property is currently not supported, returning `null`.
