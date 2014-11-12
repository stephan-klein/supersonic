###
 # @namespace components
 # @name super-model
 # @component
 # @description
 # Use data model instance with {{placeholders}}
 # @usageHtml
 # <super-model></super-model>
 # @exampleHtml

 # <super-model model-name="task"><span>{{ task.description }}</span></super-model>
###
observer = new MutationObserver (mutations) ->
  for mutation in mutations
    # Check attributes
    if mutation.type is "attributes"
      console.log "Mutation", mutation

SuperModelPrototype = Object.create HTMLElement.prototype


# What is the difference between attached and created?
SuperModelPrototype.attachedCallback = ->
  console.log "Supermodel attachedCallback"
  # Observe attributes style and class
  observerConfiguration =
    attributes: true
    attributeFilter: ["model-name"]

  observer.observe this, observerConfiguration

SuperModelPrototype.createdCallback = ->
  importSelector = "link[rel=import][href*='supersonic/components/import']"
  importDocument = document.querySelector(importSelector).import
  template = importDocument.querySelector("#super-model-template")
  @shadowRoot = @createShadowRoot()
  deepClone = true

  # add template to shadowroot
  @shadowRoot.appendChild template.content.cloneNode(deepClone)

  shadowRootTemplate = @shadowRoot.querySelector("template")
  shadowRootTemplate.appendChild @cloneNode(true)

  shadowRootTemplate.model = {
    items: [
      {name: "WAT"}
    ]
  }



  console.log "Created 6"


SuperModelPrototype.detachedCallback = ->
  #console.log "Navigation bar detachedCallback"
  observer.disconnect()
  # Hide the navbar when this node leaves the DOM

document.registerElement "super-model",
  prototype: SuperModelPrototype
