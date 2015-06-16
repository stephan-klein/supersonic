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

# device.model

The `device.model` returns the name of the device's model or
product. The value is set by the device manufacturer and may be
different across versions of the same product.

## Quick Example

    // Android:    Nexus One       returns "Passion" (Nexus One code name)
    //             Motorola Droid  returns "voles"
    // BlackBerry: Torch 9800      returns "9800"
    // iOS:     for the iPad Mini, returns iPad2,5; iPhone 5 is iPhone 5,1. See http://theiphonewiki.com/wiki/index.php?title=Models
    //
    var model = device.model;

## Android Quirks

- Gets the [product name](http://developer.android.com/reference/android/os/Build.html#PRODUCT) instead of the [model name](http://developer.android.com/reference/android/os/Build.html#MODEL), which is often the production code name. For example, the Nexus One returns `Passion`, and Motorola Droid returns `voles`.