Navigation Bar
==============

Styling the native navigation bar is very simple. Let's take a look at a few different methods for styling the navigation bar elements.

## The Back Indicator

Let's begin with taking a standard navbar with the system back button and customizing the back button. For the default system button, there are just a few things you can customize. We'll start with changing the default back indicator icon. We'll use a file that's included in your project files by default. Normally, you can reference any icon in your project files by inserting an url relative to the `www/` folder.

    navigation-bar back-indicator {
        background-image: url(icons/telescope.png);
        background-size: 18;
    }


Note that we used the back-indicator child for navigation-bar. iOS requires that a back-indicator-mask be also set, but we set it automatically to use the same image as the indicator. If you want to set an explicit indicator mask, then also specify it as follows:

    navigation-bar back-indicator-mask { ... }

## Button color

To set the tint color of the default system buttons, just use the color property of the navigation-bar, for example:

    navigation-bar {
        color: #FF3B30;
    }

## Button font

You can also set the font and color of just the system back button using something like this:

    navigation-bar back-bar-button {
        color: #34AADC;
        font-family : "Avenir";
        font-size: 16;
    }

## Custom Buttons

If you want complete control over your buttons, you can create a new button:

    var myButton = new steroids.buttons.NavigationBarButton();

Then, give it a class:

    myButton.styleClass = "awesome-nav-button";

Now, go crazy with the markup:

    .awesome-nav-button {
        shape               : arrow-button-left;
        content-edge-inset  : 0 0 0 6;
        border-radius       : 5px;
        font-family         : "American Typewriter";
        font-weight         : bold;
        font-size           : 12px;
        font-weight         : normal;
        color               : #ffffff;
        background-color    : #008ed4;
    }

Finally, to display your button, you need to attach it to your navigation bar, like this:

    var myButton = new steroids.buttons.NavigationBarButton();
    myButton.styleClass = "awesome-nav-button";

    steroids.view.navigationBar.update({
      overrideBackButton:true,
      buttons: {
        left: [myButton]
      }
    })

We can also set the icon of our custom buttons via the icon child, for example:

    navigation-bar { color: white; }

    .my-awesome-button icon {
        background-image: url(profile.svg);
        background-size: 20;
    }

Note that you cannot have a label and an icon on a button at the same time, so you should not set both. Note that we set the navigation bar's color to white so the icon renders in white.


## Navigation Bar Title and Fonts

Finally, let's review how you might set the navigation bar's title font and color as well as the title text of individual navigation items.

For the title of each item in your navigation bar, you can set all of its font properties and color via the navigation bar itself, but when it comes to changing item specific properties, like the text itself, you'll want to access the navigation-item.

Let's set the font and color of our title:

    navigation-bar title {
        color: #4CD964;
        font-family : "Avenir";
        font-size: 26;
    }