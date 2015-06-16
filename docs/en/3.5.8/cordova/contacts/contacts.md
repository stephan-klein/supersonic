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

# Contacts

> The `contacts` object provides access to the device contacts database.

__WARNING__: Collection and use of contact data raises
important privacy issues.  Your app's privacy policy should discuss
how the app uses contact data and whether it is shared with any other
parties.  Contact information is considered sensitive because it
reveals the people with whom a person communicates.  Therefore, in
addition to the app's privacy policy, you should strongly consider
providing a just-in-time notice before the app accesses or uses
contact data, if the device operating system doesn't do so
already. That notice should provide the same information noted above,
as well as obtaining the user's permission (e.g., by presenting
choices for __OK__ and __No Thanks__).  Note that some app
marketplaces may require the app to provide a just-in-time notice and
obtain the user's permission before accessing contact data.  A
clear and easy-to-understand user experience surrounding the use of
contact data helps avoid user confusion and perceived misuse of
contact data.  For more information, please see the Privacy Guide.

## Plugin version

Currently the Contact plugin uses version 0.2.11. For source code, see the [GitHub repo](https://github.com/apache/cordova-plugin-contacts/tree/0.2.11).

### Methods

- contacts.create
- contacts.find
- contacts.pickContact

### Objects

- Contact
- ContactName
- ContactField
- ContactAddress
- ContactOrganization
- ContactFindOptions
- ContactError

