steroids.buttons.NavigationBarButton
====================================

  > Buttons that can be used in the navigation bar.


Description
-----------

A button for the native navigation bar. To be used with steroids.view.navigationBar.update.

Full example
------------

    var textButton = new steroids.buttons.NavigationBarButton();
    textButton.title = "Right"
    textButton.onTap = function() { alert("Text button tapped"); }

    var imageButton = new steroids.buttons.NavigationBarButton();
    imageButton.imagePath = "/icons/pill@2x.png"
    imageButton.imageAsOriginal = "true"
    imageButton.onTap = function() { alert("Image button tapped"); }

    steroids.view.navigationBar.update({
      buttons: {
        right: [imageButton, rightButton]
      }
    })

    // On Android, only a single right button with text is supported
    //
    // steroids.view.navigationBar.setButtons({
    //  right: [rightButton]
    // });


Properties
----------

The following properties are available for navigation bar buttons. Set them after creating a new NavigationBarButton instance.

* __title__: Text title for the button. If the title text is too long, it will be truncated.
* __onTap__: Callback function for the navigation bar button. It will be evaulated in the current WebView.
* __imagePath__: Image to use for the navigation bar button, relative to the application's root. iOS only.
* __imageAsOriginal__: If set to "true", the image will be shown as original, without button tint color applied by the OS. iOS only.
