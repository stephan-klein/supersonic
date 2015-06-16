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

# Geolocation

> The `geolocation` object provides access to location data based on the device's GPS sensor or inferred from network signals.

This plugin provides information about the device's location, such as
latitude and longitude. Common sources of location information include
Global Positioning System (GPS) and location inferred from network
signals such as IP address, RFID, WiFi and Bluetooth MAC addresses,
and GSM/CDMA cell IDs. There is no guarantee that the API returns the
device's actual location.

This API is based on the
[W3C Geolocation API Specification](http://dev.w3.org/geo/api/spec-source.html),
and only executes on devices that don't already provide an implementation.

__WARNING__: Collection and use of geolocation data
raises important privacy issues.  Your app's privacy policy should
discuss how the app uses geolocation data, whether it is shared with
any other parties, and the level of precision of the data (for
example, coarse, fine, ZIP code level, etc.).  Geolocation data is
generally considered sensitive because it can reveal user's
whereabouts and, if stored, the history of their travels.
Therefore, in addition to the app's privacy policy, you should
strongly consider providing a just-in-time notice before the app
accesses geolocation data (if the device operating system doesn't do
so already).  That notice should provide the same information noted
above, as well as obtaining the user's permission (e.g., by presenting
choices for __OK__ and __No Thanks__).  For more information, please
see the Privacy Guide.

## Methods

- geolocation.getCurrentPosition
- geolocation.watchPosition
- geolocation.clearWatch

## Arguments

- geolocationSuccess
- geolocationError
- geolocationOptions

## Objects (Read-Only)

- Position
- PositionError
- Coordinates

## Supported Platforms

- Android
- iOS