---
layout: docs_device
header_title: Camera and Photo Library
header_sub_title: Access the device camera and photo library
section_id: media-apis
subsection_id: camera-and-photo-library
topics:
  - name: takePicture
    method: true
  - name: getFromPhotoLibrary
    method: true
---
# Camera

{{ site.data.supersonic.media.camera.overview.description }}

<section class="docs-section" id="takepicture">
{% assign method = site.data.supersonic.media.camera.takePicture %}
{% include api_method.md method=method %}
</section>

<section class="docs-section" id="getfromphotolibrary">
{% assign method = site.data.supersonic.media.camera.getFromPhotoLibrary %}
{% include api_method.md method=method %}
</section>
