###
 # @namespace components
 # @name super-data-repeat
 # @component
 # @description
 # Repeat all data from a Supersonic Data Model in HTML DOM. Attributes of each data object can be accessed with double-mustache notation, i.e. {{ attributeName }} will render object.attributeName.
 # @usageHtml
 # <super-data-repeat model="modelName"></super-data-repeat>
 # @exampleHtml
 # <ul class="list">
 #   <super-data-repeat model="task">
 #     <li class="item">{{ Description }}</li>
 #   </super-data-repeat>
 # </ul>
###
SuperDataRepeatPrototype = Object.create HTMLElement.prototype

# What is the difference between attached and created?
SuperDataRepeatPrototype.attachedCallback = ->
  model_name = @getAttribute("model")
  if model_name?
    Model = supersonic.data.model(model_name)
    @__listener = Model.all().whenChanged (items)=>
      @shadowRoot.innerHTML = Handlebars.compile("{{#each items}}#{@__template}{{/each}}")({items: items})

SuperDataRepeatPrototype.createdCallback = ->
  @__template = @innerHTML
  @innerHTML = ""
  @createShadowRoot()

SuperDataRepeatPrototype.detachedCallback = ->
  @__listener() if @__listener?

document.registerElement "super-data-repeat",
  prototype: SuperDataRepeatPrototype
