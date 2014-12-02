###
 # @namespace components
 # @name super-data-repeat
 # @component
 # @description
 # <p class="advanced-panel">
 #   Requires <a href="http://handlebarsjs.com" target="_blank">Handlebars.js</a> to be included in your app's layout. Install Handlebars with <code>$ bower install handlebars</code> and load it via a <code>&lt;script src="/components/handlebars/handlebars.min.js"&gt;&lt;/script&gt;</code> tag in your <code>&lt;head&gt;</code> element.
 #  <br><br>
 #  Will not work with AngularJS – use <code>ng-repeat</code> instead. (Alternatively, you can use the <code>ng-non-bindable</code> attribute in the <code>&lt;super-data-repeat&gt;</code> element, but that's a suboptimal solution.)
 # </p>
 #
 # Repeat all data from a Supersonic Data Model in HTML DOM. Attributes of each data object can be accessed with double-mustache notation, i.e. `{{ attributeName }}` will render `object.attributeName`.
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
