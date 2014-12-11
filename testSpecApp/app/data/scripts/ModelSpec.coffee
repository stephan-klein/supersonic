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

  it "can set headers through options", ->
    @timeout 5000
    supersonic.data.model('task', {
      headers:
        steroidsApiKey: window.ag.data.options.headers.steroidsApiKey
        steroidsAppId: window.ag.data.options.headers.steroidsAppId
    }).findAll().should.be.fulfilled

  it "can set headers from localstorage through options", ->
    @timeout 5000
    steroidsApiKey = supersonic.data.storage.property('steroids-api-key').set(window.ag.data.options.headers.steroidsApiKey)
    steroidsAppId = supersonic.data.storage.property('steroids-app-id').set(window.ag.data.options.headers.steroidsAppId)

    findAll = supersonic.data.model('task', {
      headers:
        steroidsApiKey: steroidsApiKey.values
        steroidsAppId: steroidsAppId.values
    }).findAll()

    findAll.finally ->
      steroidsApiKey.unset()
      steroidsAppId.unset()

    findAll.should.be.fulfilled
