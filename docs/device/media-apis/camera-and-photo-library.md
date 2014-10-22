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

<section class="docs-section" id="camera">

# Camera
{{ site.data.supersonic.media.camera.overview.description }}

## API Reference

<section class="docs-section" id="takePicture">
{% assign takePicture = site.data.supersonic.media.camera.takePicture %}
{% include api_method.md method=takePicture %}
</section>

<section class="docs-section" id="getFromPhotoLibrary">
{% assign getFromPhotoLibrary = site.data.supersonic.media.camera.getFromPhotoLibrary %}
{% include api_method.md method=getFromPhotoLibrary %}
</section>

</section>
