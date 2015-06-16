# steroids.app

  > Properties and functions for the current instance of the application.

All the `steroids.app` properties are accessible only after the Steroids `ready` event has fired (see steroids.on).

    steroids.on('ready', function() {
      alert(steroids.app.path);
      alert(steroids.app.absolutePath);
    });


## Functions
- steroids.app.getLaunchURL

## Properties
- steroids.app.absolutePath
- steroids.app.absoluteUserFilesPath
- steroids.app.path
- steroids.app.userFilesPath
