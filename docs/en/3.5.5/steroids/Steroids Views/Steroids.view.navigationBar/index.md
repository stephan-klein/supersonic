steroids.view.navigationBar
===========================

## Description

The current view (steroids.view) can have a navigation bar set at its top.  This reduces the vertical space reserved for the view.

The left side of the navigation bar is reserved for the native back button which allows the user to navigate through the `steroids.layers` native navigation stack.
The back button title will be "Back" by default, or the navigation bar title configured in the preceding `steroids.views.*`.

On iOS, the navigation bar appears automatically with steroids.layers.push, but can be set so that it doesn't appear with an option. On Android, steroids.layers.push doesn't show the navigation bar by default.

The navigation bar includes:

 - The back button on the left side, visible only if at least one layer is pushed to `steroids.layers`.
 - An optional title.
 - Optional steroids.buttons.NavigationBarButtons on the right and the left side. (Only one right side button is supported on Android).

## Methods

- steroids.view.navigationBar.show - Show the navigation bar.
- steroids.view.navigationBar.hide - Hide the navigation bar.
- steroids.view.navigationBar.setAppearance - Set the global colors and background images for the navigation bar.
- steroids.view.navigationBar.update - Update the navigation bar content.
- steroids.view.navigationBar.addStyleClass - Add a CSS style class to the navigation bar.
- steroids.view.navigationBar.setStyleClass - Set the CSS style class of the navigation bar.
- steroids.view.navigationBar.setStyleId - Set the CSS style id of the navigation bar.
- steroids.view.navigationBar.setStyleCSS - Set custom CSS for the navigation bar.

## Debug methods

- steroids.view.navigationBar.tapButton - Trigger a button tap on a navigation bar button.

## Objects

- steroids.buttons.NavigationBarButton - Represents a navigation bar button.
