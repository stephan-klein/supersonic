# steroids.views.PreviewFileView

  > Represents a file that can be previewed.

    var pdfView = new steroids.views.PreviewFileView("test.pdf");
    steroids.modal.show(pdfView);

## Description

A `steroids.views.PreviewFileView`can be used as a modal window with steroids.modal.show.

File types are the sames as those that are supported by iOS and Android respectively.

## Full Example

    var pdfView = new steroids.views.PreviewFileView({
      filePath: "downloaded.pdf"
      relativeTo: steroids.app.userFilesPath
    });

    steroids.modal.show({
      view: pdfView
    }, {
      onSuccess: function() {
        alert("pdf is being previewed")
      }
    });

## Constructor

The constructor supports a shorthand form of providing only the __path__ parameter:

    var previewView = new steroids.views.PreviewFileView("details.pdf");

For other options, the longer object form must be used:

    var previewView = new steroids.views.PreviewFileView({
      filePath: "downloaded.pdf"
      relativeTo: steroids.app.userFilesPath
    });

## Options

- __filePath__: Path to the file relative to the __relativeTo__ parameter.
- __relativeTo__: Directory the __path__ is relative to. The default value is `steroids.app.path` which should be used for files distributed with the application itself. Use `steroids.app.userFilesPath` for files in the application user files directory (`Documents` in iOS).
