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

# Compass

This plugin provides access to the device's compass. The compass is a sensor
that detects the direction or heading that the device is pointed, typically
from the top of the device.  It measures the heading in degrees from 0 to
359.99, where 0 is north.

## Supported Platforms

- Android
- iOS

## Methods

- compass.getCurrentHeading
- compass.watchHeading
- compass.clearWatch

## Objects

- CompassHeading
- CompassError