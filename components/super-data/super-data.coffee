###
 # @namespace components
 # @name super-data
 # @component
 # @description
 # Use data from a Supersonic Data record in HTML DOM. The attributes of the object can be accessed via double-mustache notation, e.g. {{ attributeName }} will render object.attributeName. Fetches the record based on the view's current `id` parameter.
 # @usageHtml
 # <super-data model="modelName"></super-data>
 # @exampleHtml
 # <!-- In index.html -->
 # <super-navigate view-id="show" params="{id: 1}"
 #
 # <!-- In show.html, shows Name and Description of Task item with id 1 -->
 # <super-data model="Task">
 #   <h2>{{ Name }}</h2>
 #   <p>{{ Description }}</p>
 # </super-data>
###
SuperDataPrototype = Object.create HTMLElement.prototype

# What is the difference between attached and created?
SuperDataPrototype.attachedCallback = ->
  model_name = @getAttribute("model")
  if model_name?
    Model = supersonic.data.model(model_name)
    @__listener = supersonic.ui.views.current.params.onValue (params) ->
      Model.find(params.id).then (object) =>
        console.log "compilin'"
        console.log @__template
        @shadowRoot.innerHTML = Handlebars.compile("#{@__template}")

SuperDataPrototype.createdCallback = ->
  @__template = @innerHTML
  @innerHTML = ""
  @createShadowRoot()

SuperDataPrototype.detachedCallback = ->
  @__listener() if @__listener?

document.registerElement "super-data",
  prototype: SuperDataPrototype
