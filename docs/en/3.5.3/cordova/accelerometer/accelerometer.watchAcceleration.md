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

# accelerometer.watchAcceleration

Retrieves the device's current `Acceleration` at a regular interval, executing
the `accelerometerSuccess` callback function each time. Specify the interval in
milliseconds via the `acceleratorOptions` object's `frequency` parameter.

The returned watch ID references the accelerometer's watch interval,
and can be used with `navigator.accelerometer.clearWatch` to stop watching the
accelerometer.

    var watchID = navigator.accelerometer.watchAcceleration(accelerometerSuccess,
                                                           accelerometerError,
                                                           [accelerometerOptions]);

- __accelerometerOptions__: An object with the following optional keys:
  - __frequency__: How often to retrieve the `Acceleration` in milliseconds. _(Number)_ (Default: 10000)


##  Example

    function onSuccess(acceleration) {
        alert('Acceleration X: ' + acceleration.x + '\n' +
              'Acceleration Y: ' + acceleration.y + '\n' +
              'Acceleration Z: ' + acceleration.z + '\n' +
              'Timestamp: '      + acceleration.timestamp + '\n');
    };

    function onError() {
        alert('onError!');
    };

    var options = { frequency: 3000 };  // Update every 3 seconds

    var watchID = navigator.accelerometer.watchAcceleration(onSuccess, onError, options);

## iOS Quirks

The API calls the success callback function at the interval requested,
but restricts the range of requests to the device between 40ms and
1000ms. For example, if you request an interval of 3 seconds,
(3000ms), the API requests data from the device every 1 second, but
only executes the success callback every 3 seconds.