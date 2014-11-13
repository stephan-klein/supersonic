###
 # @namespace components
 # @name super-model
 # @component
 # @description
 # Use data model instance with {{placeholders}}
 # @usageHtml
 # <super-model></super-model>
 # @exampleHtml

 # <super-model model="task"><span>{{ description }}</span></super-model>
###
SuperModelPrototype = Object.create HTMLElement.prototype

# What is the difference between attached and created?
SuperModelPrototype.attachedCallback = ->
  model_name = @getAttribute("model")
  if model_name?
    Model = supersonic.data.model(model_name)
    @__listener = Model.all().whenChanged (items)=>
      @shadowRoot.innerHTML = Handlebars.compile("{{#each items}}#{@__template}{{/each}}")({items: items})

SuperModelPrototype.createdCallback = ->
  @__template = @innerHTML
  @innerHTML = ""
  @createShadowRoot()

SuperModelPrototype.detachedCallback = ->
  @__listener() if @__listener?

document.registerElement "super-model",
  prototype: SuperModelPrototype
