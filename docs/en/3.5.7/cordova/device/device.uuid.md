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

# device.uuid

Get the device's Universally Unique Identifier ([UUID](http://en.wikipedia.org/wiki/Universally_Unique_Identifier)).

    var string = device.uuid;

## Description

The details of how a UUID is generated are determined by the device manufacturer and are specific to the device's platform or model.

## Quick Example

    // Android: Returns a random 64-bit integer (as a string, again!)
    //          The integer is generated on the device's first boot
    //
    // iPhone: (Paraphrased from the UIDevice Class documentation)
    //         Returns a string of hash values created from multiple hardware identifies.
    //         It is guaranteed to be unique for every device and can't be tied
    //         to the user account.
    var deviceID = device.uuid;

## iOS Quirk

The `uuid` on iOS is not unique to a device, but varies for each
application, for each installation.  It changes if you delete and
re-install the app, and possibly also when you upgrade iOS, or even
upgrade the app per version (apparent in iOS 5.1). The `uuid` is not
a reliable value.