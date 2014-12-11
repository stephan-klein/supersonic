describe "supersonic.data.model", ->
  it "is a function", ->
    supersonic.data.model.should.be.a 'function'

  it "returns a model class when given the name of a configured cloud resource", ->
    supersonic.data.model('task').should.be.a 'function'

  it "receives configured cloud resources as an injected global in window.ag.data", ->
    window.ag.data.resources.task.should.be.an 'object'

  it "should be able to retrieve a collection from the cloud with the configured settings", ->
    @timeout 5000
    supersonic.data.model('task').findAll().should.be.fulfilled
