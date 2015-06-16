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

# Camera

> The `camera` object provides access to the device's default camera application.

__Important privacy note:__ Collection and use of images from a
device's camera raises important privacy issues.  Your app's privacy
policy should discuss how the app uses the camera and whether the
images recorded are shared with any other parties.  In addition, if
the app's use of the camera is not apparent in the user interface, you
should provide a just-in-time notice prior to your app accessing the
camera (if the device operating system doesn't do so already).  That
notice should provide the same information noted above, as well as
obtaining the user's permission (e.g., by presenting choices for
__OK__ and __No Thanks__).  For more information, please see the
Privacy Guide.

## Methods

- camera.getPicture
- camera.cleanup
