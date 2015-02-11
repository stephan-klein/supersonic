---
layout: docs_data
header_title: Supersonic Data
header_sub_title: APIs to access local and cloud data
parent_id: supersonic
section_id: other-data-providers
subsection_id: kimono-labs
---

# Setting up a Kimono labs backend

[Kimono](https://www.kimonolabs.com/) is a service that makes it simple to turn any website to an API.

Once you have signed up to Kimono, you can surf to any website and _kimonify_ it, i.e. use the Kimono bookmarklet to define the parts of the site that Kimono should periodically scrape and turn to a collection that is accessible through the API.

## Configuring your API via Kimono Labs

In following we have defined a Kimono API for the _latest_ feed of the [TechCrunch website](http://techcrunch.com/).

<img class="tutorial-image" src="/img/guides/data_kimono_docs.png">

As seen from the code sample, the articles in feed can be accessed by making a HTTP GET request to the URL `https://www.kimonolabs.com/api/3koou162` with query parameter `apikey=ucB3khHPRR7SDLXOheEKIc4YIVwgKkY3`.

From the _data preview_ tab we'll see how the response looks like:

<img class="tutorial-image" src="/img/guides/data_kimono_response.png">

So, the feed items can be accessed by indexing the response with the  _root key_ `results.collection1`. Note that individual items cannot be accessed via Kimono Labs APIs.

## Setting up your Kimono Labs API as a REST provider

To use our Kimono Labs API with Supersonic Data, we need to configure it as a custom REST provider. In the Data Providers view, click on the Custom Rest API provider.

<img class="tutorial-image" src="/img/guides/data_kimono_init.png">

The _resource url path_ is the last part of the url:

<img class="tutorial-image" src="/img/guides/data_kimono_resource.png">

Next, we need to customize the access by specifying the API key, as well as the _root key_ for the response. Click on the Customize Actions button.

<img class="tutorial-image" src="/img/guides/data_kimono_customize.png">

Now we are all set! Note that the only operation that a Kimono API support is reading the whole collection. Individual items in the collection do not have their own URLs, so they cannot be accessed by Supersonic Data.
