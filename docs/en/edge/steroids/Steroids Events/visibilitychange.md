visibilitychange
================

  > An event that fires when the steroids.view.WebView visibility changes

    document.addEventListener("visibilitychange", yourCallbackFunction, false);

###Details

This extension implements [W3C Page Visibility API](https://dvcs.w3.org/hg/webperf/raw-file/tip/specs/PageVisibility/Overview.html#dom-document-visibilitystate).

The event is fired when the view becomes visible or hidden in the device's screen.  In-application this event occurrs for example, when the user changes tabs, navigates with the steroids.view.navigationBar or the application resumes from being in a 'background state'.  The event can be used for example to update content when the view becomes visible or hidden.

### Implementation Notes

When the document has loaded, the `visibilityState` is `prerender`.  After Steroids has initialized, the `visibilityState` is `visible` or `hidden` according to the actual visibility.  When the view is displayed by user interaction, the `visibilityState` changes to `visible`.  When the view becomes hidden by user interaction, the `visibilityState` changes to `hidden`.  The `document.hidden` boolean changes accordingly.

When a view is preloaded with steroids.views.WebView.prototype.preload, the `visibilityState` is `hidden` after steroids is initialized.  When the preloaded document becomes visible by steroids.layers.push or steroids.modal.show, the state changes to `visible`.

### Quick Example

    document.addEventListener("visibilitychange", onVisibilityChange, false);

    function onVisibilityChange() {
        alert("document.visibilityState: " + document.visibilityState);
        alert("document.hidden: " + document.hidden);
    }