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

# globalization.getLocaleName

Returns the BCP 47 compliant tag for the client's current locale setting.

    navigator.globalization.getLocaleName(successCallback, errorCallback);

## Description

Returns the BCP 47 compliant locale identifier string to the `successCallback`
with a `properties` object as a parameter. That object should have a `value`
property with a `String` value. The locale tag will consist of a two-letter lower
case language code, two-letter upper case country code, and (unspecified) variant
code, separated by a hyphen.

If there is an error getting the locale, then the `errorCallback`
executes with a `GlobalizationError` object as a parameter. The
error's expected code is `GlobalizationError.UNKNOWN_ERROR`.

## Supported Platforms

- Android
- iOS

## Example

When the browser is set to the `en-US` locale, this displays a popup
dialog with the text `locale: en-US`.

    navigator.globalization.getLocaleName(
        function (locale) {alert('locale: ' + locale.value + '\n');},
        function () {alert('Error getting locale\n');}
    );

## Android Quirks

- Java does not distinguish between a set "langauge" and set "locale," so this
method is essentially the same as `navigator.globalizatin.getPreferredLanguage()`.