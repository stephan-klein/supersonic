---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic utilizes web components
section_id: web-components
---

# Supersonic uses Web Components

Some of the native componets of Supersonic, such as the application navigation bar has been implemented as Web components:

```html
<super-navbar>
  <super-navbar-title>
    Hello World!
  </super-navbar-title>
</super-navbar>
```

Web components is a set of rather recent techonologies (such as custom elements, shadow DOM, HTML templates) that makes it possible to package and distribute reusable custom components. From users point of view web components works just like oridinary HTML elements.

Not all the browsers support all the technologies behind web components. [Polymer](https://www.polymer-project.org/) is a framework by Google that provides necessary polyfills sothat Web components can be utilized also at the the nonsupported browsers.

Learn more about webcomponents

 - [http://webcomponents.org/](http://webcomponents.org/)
 - [https://www.polymer-project.org/](https://www.polymer-project.org/)
