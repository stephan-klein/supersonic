---
layout: docs_ui
header_title: Dialogs
header_sub_title: Learn how to display native dialogs in your app.
section_id: dialogs
---

<section class="docs-section" id="dialogs">

# Dialogs

Displaying native dialogs is awesome, but the syntax for the core Cordova dialog
plugins sucks.

We wrapped the core dialogs and promisified them. Nothing more, just the goods.

## Dialogs are blocking

Note that dialogs will block JavaScript execution on the page underneath while they are displayed.

</section>
<section class="docs-section" id="alert">

<h2>Alert</h2>

Alerts are the simplest dialog: just a title, an optional message and a button to dismiss the dialog.

{% assign method = site.data.supersonic.ui.dialog.alert %}
{% include api_method.md method=method %}

</section>
<section class="docs-section" id="confirm">

<h2>Confirm</h2>

Confirm is one step more complex than alert: it allows you to specify multiple buttons and determine which one was tapped.

{% assign method = site.data.supersonic.ui.dialog.confirm %}
{% include api_method.md method=method %}

</section>
<section class="docs-section" id="prompt">

<h2>Prompt</h2>

In addition to multiple buttons, prompts allow the user to also input text.

{% assign method = site.data.supersonic.ui.dialog.prompt %}
{% include api_method.md method=method %}

</section>