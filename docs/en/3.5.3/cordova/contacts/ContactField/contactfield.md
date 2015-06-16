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

- __pref__: Set to `true` if this `ContactField` contains the user's preferred value. _(boolean)_

## Supported Platforms

- Android
- iOS

## Example

        // create a new contact
        var contact = navigator.contacts.create();

        // store contact phone numbers in ContactField[]
        var phoneNumbers = [];
        phoneNumbers[0] = new ContactField('work', '212-555-1234', false);
        phoneNumbers[1] = new ContactField('mobile', '917-555-5432', true); // preferred number
        phoneNumbers[2] = new ContactField('home', '203-555-7890', false);
        contact.phoneNumbers = phoneNumbers;

        // save the contact
        contact.save();

## Android Quirks

- __pref__: Not supported, returning `false`.

## iOS Quirks

- __pref__: Not supported, returning `false`.