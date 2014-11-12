---
layout: docs_overview
title: Supersonic Documentation
header_title: Supersonic App Logic and Structure
header_sub_title: Learn how Supersonic utilizes web components
section_id: web-components
parent_id: supersonic
---

<section class="docs-section" id="web-components">
# Supersonic uses Web Components

Some of the native componets of Supersonic, such as the application [navigation bar][nav-bar-guide] has been implemented as Web components:

```html
<super-navbar>
  <super-navbar-title>
    Hello World!
  </super-navbar-title>
</super-navbar>
```

Web components is a set of rather recent techonologies (such as custom elements, shadow DOM, HTML templates) that makes it possible to package and distribute reusable custom web components. From users point of view web components works just like oridinary HTML elements.

Not all the browsers support all the technologies enabling the use of web components. [Polymer](https://www.polymer-project.org/) is a framework by Google that provides necessary polyfills so that Web components can be utilized also at the the nonsupported browsers. Supersonic uses Polymer to ensure the usability of web components in all the supported platforms.

Learn more about webcomponents

 - [http://webcomponents.org/](http://webcomponents.org/)
 - [https://www.polymer-project.org/](https://www.polymer-project.org/)

</section>

[nav-bar-guide]: /supersonic/guides/ui/native-components/navigation-bar/