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

# LocalFileSystem

This object provides a way to obtain root file systems.

## Methods

- __requestFileSystem__: Requests a filesystem. _(Function)_

- __resolveLocalFileSystemURL__: Retrieve a `DirectoryEntry` or `FileEntry` using local URL. _(Function)_

## Constants

- `LocalFileSystem.PERSISTENT`: Used for storage that should not be removed by the user agent without application or user permission.

- `LocalFileSystem.TEMPORARY`: Used for storage with no guarantee of persistence.

## Details

The `LocalFileSystem` object methods are defined on the `window` object.

# resolveLocalFileSystemURL

> Retrieve a fileEntry based on it's local URL

    window.resolveLocalFileSystemURL(url, successCallback, errorCallback);

- __url__: the location of the fileEntry, e.g. "file:///example.txt"
- __successCallback__: invoked with a fileEntry object
- __errorCallback (optional)__: invoked if error occurs when resolving the file URL

## Resolve Local File System URL Quick Example

    function onSuccess(fileEntry) {
        console.log(fileEntry.name);
    }

    window.resolveLocalFileSystemURL("file:///example.txt", onSuccess, onError);


# requestFileSystem

> Request a file system in which to store application data.

     window.requestFileSystem(type, size, successCallback, errorCallback)

- __type__: determines whether the file storage should be persistent. Possible values `LocalFileSystem.TEMPORARY` and `LocalFileSystem.PERMANENT`
- __size__: the size of requested storage (in bytes)
- __successCallback__: invoked with a FileSystem object
- __errorCallback (optional)__:  invoked if error occurs retrieving file system

## Request File System Quick Example

    function onSuccess(fileSystem) {
        console.log(fileSystem.name);
    }

    // request the persistent file system
    window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, onSuccess, onError);


## Full Example

    <!DOCTYPE html>
    <html>
      <head>
        <title>Local File System Example</title>

        <script type="text/javascript" charset="utf-8" src="/cordova.js"></script
        <script type="text/javascript" charset="utf-8" src="/components/steroids-js/steroids.js"></script>
        <script type="text/javascript" charset="utf-8">

        // Wait for device API libraries to load
        //
        document.addEventListener("deviceready", onDeviceReady, false);

        // device APIs are available
        //
        function onDeviceReady() {
            window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, onFileSystemSuccess, fail);
            window.resolveLocalFileSystemURL("file:///example.txt", onResolveSuccess, fail);
        }

        function onFileSystemSuccess(fileSystem) {
            console.log(fileSystem.name);
        }

        function onResolveSuccess(fileEntry) {
            console.log(fileEntry.name);
        }

        function fail(evt) {
            console.log(evt.target.error.code);
        }

        </script>
      </head>
      <body>
        <h1>Example</h1>
        <p>Local File System</p>
      </body>
    </html>
