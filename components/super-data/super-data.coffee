###
 # @namespace components
 # @name super-data
 # @component
 # @description
 # <p class="advanced-panel">
 #   Requires <a href="http://handlebarsjs.com" target="_blank">Handlebars.js</a> to be included in your app's layout. Install Handlebars with <code>$ bower install handlebars</code> and load it via a <code>&lt;script src="/components/handlebars/handlebars.min.js"&gt;&lt;/script&gt;</code> tag in your <code>&lt;head&gt;</code> element.
 #  <br><br>
 #  Will not work with AngularJS – fetch the cloud data resource in the controller and use regular Angular binding instead. (Alternatively, you can use the <code>ng-non-bindable</code> attribute in the <code>&lt;super-data&gt;</code> element, but that's a suboptimal solution.)
 # </p>
 #
 # Use data from a Supersonic Data record in HTML DOM. The attributes of the object can be accessed via double-mustache notation, e.g. `{{ attributeName }}` will render `object.attributeName`. Fetches the record based on the view's current `id` parameter (set via `supersonic.ui.layers.push` or the `data-params-id` attribute in a `<super-navigate>` element).
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
  @__visibility_listener = supersonic.ui.views.current.whenHidden =>
    @shadowRoot.innerHTML = ""

  model_name = @getAttribute("model")
  if model_name?
    Model = supersonic.data.model(model_name)
    @__data_listener = supersonic.ui.views.current.params.onValue (params) =>
      Model.find(params.id).then (object) =>
        @shadowRoot.innerHTML = Handlebars.compile("#{@__template}")(object)

SuperDataPrototype.createdCallback = ->
  @__template = @innerHTML
  @innerHTML = ""
  @createShadowRoot()

SuperDataPrototype.detachedCallback = ->
  @__data_listener() if @__data_listener?
  @__visibility_listener() if @__visibility_listener()

document.registerElement "super-data",
  prototype: SuperDataPrototype
