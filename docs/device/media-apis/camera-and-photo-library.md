---
layout: docs_device
header_title: Camera and Photo Library
header_sub_title: Access the device camera and photo library
section_id: media-apis
subsection_id: camera-and-photo-library
methods:
  - name: takePicture
  - name: getFromPhotoLibrary
---

{% assign methods = site.data.supersonic.media.camera %}

<section class="docs-section" id="{{page.subsection_id}}">

# {{page.header_title}}

{% include api_bentry.md methods=methods %}

</section>
