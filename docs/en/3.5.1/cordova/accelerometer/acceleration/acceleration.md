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

# Acceleration

Contains `Accelerometer` data captured at a specific point in time.
Acceleration values include the effect of gravity (9.81 m/s^2), so that when a
device lies flat and facing up, _x_, _y_, and _z_ values returned should be
`0`, `0`, and `9.81`.

## Properties

- __x__:  Amount of acceleration on the x-axis. (in m/s^2) _(Number)_
- __y__:  Amount of acceleration on the y-axis. (in m/s^2) _(Number)_
- __z__:  Amount of acceleration on the z-axis. (in m/s^2) _(Number)_
- __timestamp__: Creation timestamp in milliseconds. _(DOMTimeStamp)_

