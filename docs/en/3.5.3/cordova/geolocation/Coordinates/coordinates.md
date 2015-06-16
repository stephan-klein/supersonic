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

# Coordinates

A `Coordinates` object is attached to a `Position` object that is
available to callback functions in requests for the current position.
It contains a set of properties that describe the geographic coordinates of a position.

## Properties

* __latitude__: Latitude in decimal degrees. _(Number)_

* __longitude__: Longitude in decimal degrees. _(Number)_

* __altitude__: Height of the position in meters above the ellipsoid. _(Number)_

* __accuracy__: Accuracy level of the latitude and longitude coordinates in meters. _(Number)_

* __altitudeAccuracy__: Accuracy level of the altitude coordinate in meters. _(Number)_

* __heading__: Direction of travel, specified in degrees counting clockwise relative to the true north. _(Number)_

* __speed__: Current ground speed of the device, specified in meters per second. _(Number)_

## Android Quirks

__altitudeAccuracy__: Not supported by Android devices, returning `null`.
