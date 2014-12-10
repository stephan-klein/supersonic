
describe "supersonic.data.storage.property", ->
  
  it "is a function", ->
    supersonic.data.storage.property.should.be.a 'function'

  it "accepts a name and returns a property with that name", ->
    supersonic.data.storage.property("this-is-a-property")
      .should.have.property('name')
      .equal 'this-is-a-property'
