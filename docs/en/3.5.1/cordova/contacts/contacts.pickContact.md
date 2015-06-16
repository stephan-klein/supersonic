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

# contacts.pickContact

The `navigator.contacts.pickContact` method launches the Contact Picker to select a single contact.
The resulting object is passed to the `contactSuccess` callback
function specified by the __contactSuccess__ parameter.

## Parameters

- __contactSuccess__: Success callback function invoked with the single Contact object. [Required]

- __contactError__: Error callback function, invoked when an error occurs. [Optional]

## Supported Platforms

- Android
- iOS

## Example

    navigator.contacts.pickContact(function(contact){
            console.log('The following contact has been selected:' + JSON.stringify(contact));
        },function(err){
            console.log('Error: ' + err);
        });