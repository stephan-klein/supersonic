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

# globalization.dateToString

Returns a date formatted as a string according to the client's locale and timezone.

    navigator.globalization.dateToString(date, successCallback, errorCallback, options);

## Description

Returns the formatted date `String` via a `value` property accessible
from the object passed as a parameter to the `successCallback`.

The inbound `date` parameter should be of type `Date`.

If there is an error formatting the date, then the `errorCallback`
executes with a `GlobalizationError` object as a parameter. The
error's expected code is `GlobalizationError.FORMATTING_ERROR`.

The `options` parameter is optional, and its default values are:

    {formatLength:'short', selector:'date and time'}

The `options.formatLength` can be `short`, `medium`, `long`, or `full`.

The `options.selector` can be `date`, `time` or `date and time`.

## Supported Platforms

- Android
- iOS

## Example

If the browser is set to the `en_US` locale, this displays a popup
dialog with text similar to `date: 9/25/2012 4:21PM` using the default
options:

    navigator.globalization.dateToString(
        new Date(),
        function (date) { alert('date: ' + date.value + '\n'); },
        function () { alert('Error getting dateString\n'); },
        { formatLength: 'short', selector: 'date and time' }
    );

