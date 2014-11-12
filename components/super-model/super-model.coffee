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

  observer.observe @, observerConfiguration

  Model = supersonic.data.model(@getAttribute("model"))
  console.log "Created Model:", Model
  Model.all().whenChanged (items)=>
    console.log "Items received:", items
    debugger
    @shadowRoot.innerHTML = Handlebars.compile("{{#each items}}#{@template}{{/each}}")({items: items})






SuperModelPrototype.createdCallback = ->
  @template = @innerHTML
  @createShadowRoot()


SuperModelPrototype.detachedCallback = ->
  #console.log "Navigation bar detachedCallback"
  observer.disconnect()
  # Hide the navbar when this node leaves the DOM

document.registerElement "super-model",
  prototype: SuperModelPrototype
