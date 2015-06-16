<!---
    Licensed to the Apache Software Foundation (ASF) under one
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
-->

# FileTransfer

The `FileTransfer` object provides a way to upload files using an HTTP
multi-part POST request, and to download files as well.

## Properties

- __onprogress__: Called with a `ProgressEvent` whenever a new chunk of data is transferred. _(Function)_

## Methods

- __upload__: sends a file to a server.

- __download__: downloads a file from server.

- __abort__: Aborts an in-progress transfer.

## Objects

- FileUploadResult
- FileTransferError

## Supported Platforms

- Android
- iOS

## Backwards Compatibility Notes

Previous versions of this plugin would only accept device-absolute-file-paths as the source for uploads, or as the target for downloads. These paths would typically be of the form

    /var/mobile/Applications/<application UUID>/Documents/path/to/file  (iOS)
    /storage/emulated/0/path/to/file                                    (Android)

For backwards compatibility, these paths are still accepted, and if your application has recorded paths like these in persistent storage, then they can continue to be used.

These paths were previously exposed in the `fullPath` property of `FileEntry` and `DirectoryEntry` objects returned by the File plugin. New versions of the File plugin, however, no longer expose these paths to JavaScript.

If you are upgrading to a new (1.0.0 or newer) version of File, and you have previously been using `entry.fullPath` as arguments to `download()` or `upload()`, then you will need to change your code to use filesystem URLs instead.

`FileEntry.toURL()` and `DirectoryEntry.toURL()` return a filesystem URL of the form

    cdvfile://localhost/persistent/path/to/file

which can be used in place of the absolute file path in both `download()` and `upload()` methods.
