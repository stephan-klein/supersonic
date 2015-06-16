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

# Connection

> The `connection` object, exposed via `navigator.connection`,  provides information about the device's cellular and wifi connection.

This plugin provides an implementation of an old version of the
[Network Information API](http://www.w3.org/TR/2011/WD-netinfo-api-20110607/).
It provides information about the device's cellular and
wifi connection, and whether the device has an internet connection.

## Supported Platforms

- Android
- iOS

## Properties

- connection.type

## Constants

- Connection.UNKNOWN
- Connection.ETHERNET
- Connection.WIFI
- Connection.CELL_2G
- Connection.CELL_3G
- Connection.CELL_4G
- Connection.CELL
- Connection.NONE

## Network-related Events

- Online
- Offline