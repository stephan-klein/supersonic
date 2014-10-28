---
layout: docs_ui
header_title: Rotations
header_sub_title: Learn how to make your app rotate to different rotations.
section_id: app
subsection_id: dialogs
topics:
  - name: Alert
  - name: alert
    method: true
  - name: Confirm
  - name: confirm
    method: true
  - name: Prompt
  - name: prompt
    method: prompt
---

<section class="docs-section" id="dialogs">
# Dialogs

Displaying native dialogs is awesome, but the syntax for the core Cordova dialog
plugins sucks.

We wrapped the core dialogs and promisified them. Nothing more, just the goods.

## Dialogs are blocking

Note that dialogs will block JavaScript execution on the page underneath while they are displayed.

<section class="docs-section" id="alert">
## Alert

Alerts are the simplest dialog: just a title, an optional message and a button to dismiss the dialog.

{% assign method = site.data.supersonic.ui.dialog.alert.alert %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="confirm">
## Confirm

Confirm is one step more complex than alert: it allows you to specify multiple buttons and determine which one was tapped.

{% assign method = site.data.supersonic.ui.dialog.confirm.confirm %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="prompt">
## Prompt

In addition to multiple buttons, prompts allow the user to also input text.

{% assign method = site.data.supersonic.ui.dialog.prompt.prompt %}
{% include api_method.md method=method %}
</section>

</section>
