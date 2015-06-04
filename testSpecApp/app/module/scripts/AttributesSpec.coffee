describe "supersonic.module.attributes", ->
  it "should be defined", ->
    supersonic.module.attributes.should.be.defined

  describe "get", ->
    it "is a function", ->
      supersonic.module.attributes.get.should.be.a 'function'

    it "can retrieve an attribute from the wrapping iframe element", ->
      supersonic.module.attributes.get('attribute-from-iframe').should.equal 'right here'

    it "can retrieve an attribute from the containing window's location's query string", ->
      supersonic.module.attributes.get('attribute-from-url-param').should.equal 'present'

    it "can be provided with a default value in case the attribute does not exist", ->
      supersonic.module.attributes.get('attribute-from-nowhere', 'default value').should.equal 'default value'

  describe "has", ->
    it "is a function", ->
      supersonic.module.attributes.has.should.be.a 'function'

    it "returns false if attribute is not available anywhere", ->
      supersonic.module.attributes.has('attribute-from-nowhere').should.equal false

    it "can report existence of an attribute on the wrapping iframe element", ->
      supersonic.module.attributes.has('attribute-from-iframe').should.equal true

    it "can report existence of a param on the containing window's location's query string", ->
      supersonic.module.attributes.has('attribute-from-url-param').should.equal true
