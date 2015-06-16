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

# Globalization

This plugin obtains information and performs operations specific to the user's
locale, language, and timezone. Note the difference between locale and language:
locale controls how numbers, dates, and times are displayed for a region, while
language determines what language text appears as, independently of locale settings.
Often developers use locale to set both settings, but there is no reason a user
couldn't set her language to "English" but locale to "French", so that text is
displayed in English but dates, times, etc., are displayed as they are in France.
Unfortunately, most mobile platforms currently do not make a distinction between
these settings.

## Objects

- GlobalizationError

## Methods

- globalization.getPreferredLanguage
- globalization.getLocaleName
- globalization.dateToString
- globalization.stringToDate
- globalization.getDatePattern
- globalization.getDateNames
- globalization.isDayLightSavingsTime
- globalization.getFirstDayOfWeek
- globalization.numberToString
- globalization.stringToNumber
- globalization.getNumberPattern
- globalization.getCurrencyPattern
