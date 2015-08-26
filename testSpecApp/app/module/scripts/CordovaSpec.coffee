describe 'supersonic.module.cordovaSupport', ->

  it 'is an object', ->
    supersonic.module.should.have.property('cordovaSupport').be.an 'object'

  it 'has an init function', ->
    supersonic.module.cordovaSupport.should.have.property('init').be.an 'function'

  describe 'supersonic.module.cordovaSupport.init', ->

    beforeEach ->

      cordovaMock =
        require : (required)->
          mock =
            "constantsPlugin":
              TEMPORARY:0
              PERSISTENT:1
            "objectPlugin":
              funcX: -> 1
            "functionPlugin":-> 1
            "cordova/plugin_list": [
              {
                "id": "objectPlugin"
                "clobbers": ["ObjectPlugin"]
              }
              {
                "id": "functionPlugin"
                "clobbers": ["FunctionPlugin"]
              }
              {
                "id": "constantsPlugin",
                "clobbers": [
                    "window.ConstantsPlugin"
                ],
                "merges": [
                    "window"
                ]
              }
            ]

          return mock[required]


      steroidsMock = {}
      window.parent =
        cordova:cordovaMock
        steroids:steroidsMock
        document:
          addEventListener: ->

      delete window.cordova
      delete window.steroids
      delete window.ObjectPlugin
      delete window.FunctionPlugin
      delete window.ConstantsPlugin

    it 'maps the cordova global var', ->
      window.should.not.have.property('cordova')
      supersonic.module.cordovaSupport.init()
      window.should.have.property('cordova').be.an 'object'

    it 'maps the steroids global var', ->
      window.should.not.have.property('steroids')
      supersonic.module.cordovaSupport.init()
      window.should.have.property('steroids').be.an 'object'

    it 'maps the an object plugin', ->
      window.should.not.have.property('ObjectPlugin')
      supersonic.module.cordovaSupport.init()
      window.should.have.property('ObjectPlugin').be.an 'object'

    it 'maps the an function plugin', ->
      window.should.not.have.property('FunctionPlugin')
      supersonic.module.cordovaSupport.init()
      window.should.have.property('FunctionPlugin').be.an 'function'

    it 'maps the an constants plugin', ->
      window.should.not.have.property('ConstantsPlugin')
      supersonic.module.cordovaSupport.init()
      window.should.have.property('ConstantsPlugin').be.an 'object'
      window.should.have.property 'TEMPORARY'
      window.should.have.property 'PERSISTENT'
