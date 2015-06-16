steroids.File
==========

  > Represents a file in the device's filesystem.

Constructor
-----------

The constructor supports a shorthand form of providing only the __path__ parameter:

    var bundledImage = new steroids.File("image.png");

For other options, the longer object form must be used:

    var downloadedImage = new steroids.File({
      path: "image.png"
      relativeTo: steroids.app.userFilesPath
    })

### Constructor options

- __path__: Path to the file relative to the __relativeTo__ parameter.
- __relativeTo__: Directory the __path__ is relative to. The default value is `steroids.app.path` which should be used for files distributed with the application itself. Use `steroids.app.userFilesPath` for files in the application user files directory (`Documents` in iOS).


steroids.File.prototype.resizeImage
=======

Resizes the target image.

Cannot be called if the __relativeTo__ parameter is set to the default value `steroids.app.path`, as files distributed with the application itself are read-only due to OS-level restrictions. To resize such files, they must first be copied to the application's user files directory.

Quick example
-------------

    var sourceImage = new steroids.File({
      path: "image.png"
      relativeTo: steroids.app.userFilesPath
    });

    sourceImage.resizeImage({
      constraint: {
        dimension: "width",
        length: "150"
      }
    });

### Options

- __format__: The format and options for the processed file. (Optional)
  - __type__: Format, supported values are: {jpg, png}
  - __compression__: Compression percentage for jpg, valid values are: 0 ... 100, where 0 is not compressed and 100 is 100% compression.
  - __constraint__: Resize constraints. __Required__.
  - __dimension__: Valid values are: {width, height}. __Required__.
  - __length__: Resize constraint for the dimension. __Required__.

Full example
------------

    var downloadedImage = new steroids.File("image.png");
    downloadedImage.resizeImage({
      format: {
        type: "jpg",
        compression: 80
      },
      constraint: {
        dimension: "width",
        length: "150"
      }
    }, {
      onSuccess: function() {
        alert("resized successfully");
      },
      onFailure: function() {
        alert("resize failed");
      }
    });

Callbacks
---------

- __onSuccess__: Called once the resize has been completed.
- __onFailure__: Called if the resize failed.


Supported Platforms
-------------------

- iOS


steroids.File.prototype.unzip
=======

  > Extracts a zip archive into the application filesystem

Quick example
-------------

    var downloadedArchive = new steroids.File("archive.zip");
    downloadedArchive.unzip("directoryRelativeToUserFilesDirectory");

### Options

- __destinationPath__: The path relative to the application user files directory (`Documents` in iOS). There is no __relativeTo__ option since the user files directory is the only directory guaranteed to be writable.


Full example
------------

    var downloadedArchive = new steroids.File("archive.zip");
    downloadedArchive.unzip({
      destinationPath: "directoryRelativeToUserFilesDirectory"
    }, {
      onSuccess: function() {
        alert("resized successfully");
      },
      onFailure: function() {
        alert("resize failed");
      }
    });



Callbacks
---------

- __onSuccess__: Called once the file has been extracted.
- __onFailure__: Called if the file could not be extracted.


Supported Platforms
-------------------

- iOS
