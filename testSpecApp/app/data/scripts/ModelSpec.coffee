
FileFixture = do ->
  # Encodes a red dot test image
  # Source: http://en.wikipedia.org/wiki/Data_URI_scheme#Examples
  redDotDataUri = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=="

  # Convert a data uri to an uploadable Blob
  dataUriToBlob = (dataUri) ->
    [type, encoding, content] = /data:([^;]*);([^,]*),(.*)$/.exec dataUri
    binary = atob content
    chars = (binary.charCodeAt(i) for i in [0..binary.length-1])
    new Blob(
      [new Uint8Array(chars)]
      { type }
    )

  {
    uploadableBlob: -> dataUriToBlob redDotDataUri
  }

describe "supersonic.data.model", ->
  before ->
    supersonic.data.session.clear()

  it "is a function", ->
    supersonic.data.model.should.be.a 'function'

  describe "for any configured resource", ->
    it "returns a model class when given the name of a configured cloud resource", ->
      supersonic.data.model('SandboxTask').should.be.a 'function'

    it "receives configured cloud resources as an injected global in window.ag.data", ->
      window.ag.data.resources.SandboxTask.should.be.an 'object'

  describe "with a sandbox resource", ->

    describe "findAll", ->
      it "should be able to retrieve a collection", ->
        @timeout 5000
        SandboxTaskModel = supersonic.data.model('SandboxTask', {
          cache:
            enabled: false
        })

        SandboxTaskModel.findAll().should.be.fulfilled

    describe "all", ->
      describe "whenChanged", ->
        it "is notified after a record is created", ->
          @timeout 5000
          SandboxTaskModel = supersonic.data.model('SandboxTask', {
            cache:
              enabled: true
          })

          tasksAfterCreate = new Promise (resolve) ->
            SandboxTaskModel
              .all({}, interval: 1000)
              .updates
              .skip(1)
              .onValue resolve

          recordCreated = SandboxTaskModel.create(description: "supersonic.data.model.all test object")

          Promise.all([tasksAfterCreate, recordCreated]).spread (tasks, task) ->
            tasks.toJson().should.deep.include.members [
              task.toJson()
            ]

  describe "with a remote resource", ->
    describe "findAll", ->
      it "should be able to retrieve a collection", ->
        @timeout 5000

        supersonic.data.model('BuiltIOTask', {
          cache:
            enabled: false
        }).findAll().should.be.fulfilled

  describe "with a sandbox resource that has file fields", ->
    describe "create", ->
      it "should handle a file upload", ->
        @timeout 5000
        supersonic.data.model('SandboxFileResource').create({
          description: 'supersonic.data.model.create test object'
          file: FileFixture.uploadableBlob()
        }).then (fileResource) ->
          fileResource.should.have.property('file').be.an 'object'
          fileResource.file.should.have.property('uploaded').equal true
          fileResource.file.should.have.property('download_url').be.a 'string'

      it "accepts an optional transaction handler", (done) ->
        @timeout 5000
        supersonic.data.model('SandboxFileResource').create {}, (t) ->
          done asserting ->
            t.should.be.an 'object'
            t.should.have.property('done').property('then').be.a 'function'
            t.should.have.property('abort').be.a 'function'

    describe "update", ->
      it "should handle a file upload", ->
        supersonic.data.model('SandboxFileResource').create({
          description: 'supersonic.data.model.update test object'
        }).then (fileResource) ->
          fileResource.should.have.property('file').property('uploaded').equal false
          supersonic.data.model('SandboxFileResource').update(fileResource.id, {
            file: FileFixture.uploadableBlob()
          }).should.eventually.have.property('file').property('uploaded').equal true

      it "accepts an optional transaction handler", (done) ->
        supersonic.data.model('SandboxFileResource').create({
          description: 'supersonic.data.model.update test object'
        }).then (fileResource) ->
          supersonic.data.model('SandboxFileResource').update fileResource.id, {}, (t) ->
            done asserting ->
              t.should.be.an 'object'
              t.should.have.property('done').property('then').be.a 'function'
              t.should.have.property('abort').be.a 'function'

  describe "when passing in options", ->

    describe "assumptions", ->
      it "will fail to fetch any data if the correct headers are not in place", ->
        @timeout 5000
        supersonic.data.model('SandboxTask', {
          headers:
            steroidsApiKey: 'this is not the key you are looking for'
          cache:
            enabled: false
        }).findAll().should.not.be.fulfilled

    describe "behavior", ->

      it "can set headers through options", ->
        @timeout 5000
        supersonic.data.model('SandboxTask', {
          headers:
            steroidsApiKey: window.ag.data.options.headers.steroidsApiKey
            steroidsAppId: window.ag.data.options.headers.steroidsAppId
          cache:
            enabled: false
        }).findAll().should.be.fulfilled

      it "should retain default headers even after setting new ones", ->
        @timeout 5000
        # The call to findAll _should_ fail in case this overrides all default headers,
        # ie. steroidsApiKey is left out of the request
        supersonic.data.model('SandboxTask', {
          headers:
            steroidsAppId: window.ag.data.options.headers.steroidsAppId
          cache:
            enabled: false
        }).findAll().should.be.fulfilled

      describe "options with stream values", ->
        steroidsApiKey = null
        steroidsAppId = null

        beforeEach ->
          steroidsApiKey = supersonic.data.storage.property('steroids-api-key')
          steroidsAppId = supersonic.data.storage.property('steroids-app-id')

        afterEach ->
          steroidsApiKey.unset()
          steroidsAppId.unset()

        it "can sync headers with localstorage", ->
          @timeout 5000
          steroidsApiKey.set(window.ag.data.options.headers.steroidsApiKey)
          steroidsAppId.set(window.ag.data.options.headers.steroidsAppId)

          supersonic.data.model('SandboxTask', {
            headers:
              steroidsApiKey: steroidsApiKey.values
              steroidsAppId: steroidsAppId.values
            cache:
              enabled: false
          }).findAll().should.be.fulfilled
