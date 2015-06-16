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

# Storage

> Provides access to the device's storage options.

This API offers storage options based on two different W3C
specifications:

* The
  [Web Storage API Specification](http://dev.w3.org/html5/webstorage/)
  allows you to access data via simple key/value pairs.  See the
  section on localStorage for complete details on this interface.

* The
  [Web SQL Database Specification](http://dev.w3.org/html5/webdatabase/)
  offers more full-featured database tables accessed via SQL queries.
  A summary of this interface appears immediately below.

Cordova provides access to both interfaces for the minority of devices
that don't already support them. Otherwise the built-in
implementations apply.

## Methods

- openDatabase

## Arguments

- database_name
- database_version
- database_displayname
- database_size

## Objects

- Database
- SQLTransaction
- SQLResultSet
- SQLResultSetRowList
- SQLError
