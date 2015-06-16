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

# upload

__Parameters__:

- __fileURL__: Filesystem URL representing the file on the device. For backwards compatibility, this can also be the full path of the file on the device. (See [Backwards Compatibility Notes] below)

- __server__: URL of the server to receive the file, as encoded by `encodeURI()`.

- __successCallback__: A callback that is passed a `Metadata` object. _(Function)_

- __errorCallback__: A callback that executes if an error occurs retrieving the `Metadata`. Invoked with a `FileTransferError` object. _(Function)_

- __trustAllHosts__: Optional parameter, defaults to `false`. If set to `true`, it accepts all security certificates. This is useful since Android rejects self-signed security certificates. Not recommended for production use. Supported on Android and iOS. _(boolean)_

- __options__: Optional parameters _(Object)_. Valid keys:
  - __fileKey__: The name of the form element.  Defaults to `file`. (DOMString)
  - __fileName__: The file name to use when saving the file on the server.  Defaults to `image.jpg`. (DOMString)
  - __mimeType__: The mime type of the data to upload.  Defaults to `image/jpeg`. (DOMString)
  - __params__: A set of optional key/value pairs to pass in the HTTP request. (Object)
  - __chunkedMode__: Whether to upload the data in chunked streaming mode. Defaults to `true`. (Boolean)
  - __headers__: A map of header name/header values. Use an array to specify more than one value. (Object)

## Example

    // !! Assumes variable fileURL contains a valid URL to a text file on the device,
    //    for example, cdvfile://localhost/persistent/path/to/file.txt

    var win = function (r) {
        console.log("Code = " + r.responseCode);
        console.log("Response = " + r.response);
        console.log("Sent = " + r.bytesSent);
    }

    var fail = function (error) {
        alert("An error has occurred: Code = " + error.code);
        console.log("upload error source " + error.source);
        console.log("upload error target " + error.target);
    }

    var options = new FileUploadOptions();
    options.fileKey = "file";
    options.fileName = fileURL.substr(fileURL.lastIndexOf('/') + 1);
    options.mimeType = "text/plain";

    var params = {};
    params.value1 = "test";
    params.value2 = "param";

    options.params = params;

    var ft = new FileTransfer();
    ft.upload(fileURL, encodeURI("http://some.server.com/upload.php"), win, fail, options);

## Example with Upload Headers and Progress Events (Android and iOS only)

    function win(r) {
        console.log("Code = " + r.responseCode);
        console.log("Response = " + r.response);
        console.log("Sent = " + r.bytesSent);
    }

    function fail(error) {
        alert("An error has occurred: Code = " + error.code);
        console.log("upload error source " + error.source);
        console.log("upload error target " + error.target);
    }

    var uri = encodeURI("http://some.server.com/upload.php");

    var options = new FileUploadOptions();
    options.fileKey="file";
    options.fileName=fileURL.substr(fileURL.lastIndexOf('/')+1);
    options.mimeType="text/plain";

    var headers={'headerParam':'headerValue'};

    options.headers = headers;

    var ft = new FileTransfer();
    ft.onprogress = function(progressEvent) {
        if (progressEvent.lengthComputable) {
          loadingStatus.setPercentage(progressEvent.loaded / progressEvent.total);
        } else {
          loadingStatus.increment();
        }
    };
    ft.upload(fileURL, uri, win, fail, options);