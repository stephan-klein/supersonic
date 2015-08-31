chai = require('chai')
chai.should()

cordovaSupport = require '../../src/supersonic/core/module/cordova-support'

describe 'supersonic.module.cordovaSupport', ->

  it 'is a function', ->
    cordovaSupport.should.be.a 'function'

  it 'returns an init function', ->
    cordovaSupport(superglobal = {}, global = {}).should.have.property('init').be.an 'function'

  describe 'init', ->

    initWithCordovaPlugins = (cordovaPlugins = {}) ->
      cordovaMock =
        require: (required) ->
          return cordovaPlugins[required]

      steroidsMock = {}
      parentWindow =
        cordova:cordovaMock
        steroids:steroidsMock
        document:
          addEventListener: ->

      window = {}
      cordovaSupport(parentWindow, window).init()
      window


    it 'maps the cordova global var', ->
      window = initWithCordovaPlugins()
      window.should.have.property('cordova').be.an 'object'

    it 'maps the steroids global var', ->
      window = initWithCordovaPlugins()
      window.should.have.property('steroids').be.an 'object'

    it 'maps an object plugin', ->
      window = initWithCordovaPlugins {
        "objectPlugin":
          funcX: -> 1
        "cordova/plugin_list": [
          {
            "id": "objectPlugin"
            "clobbers": ["ObjectPlugin"]
          }
        ]
      }
      window.should.have.property('ObjectPlugin').be.an 'object'

    it 'maps a function plugin', ->
      window = initWithCordovaPlugins {
        "functionPlugin": -> 1
        "cordova/plugin_list": [
          {
            "id": "functionPlugin"
            "clobbers": ["FunctionPlugin"]
          }
        ]
      }
      window.should.have.property('FunctionPlugin').be.an 'function'

    it 'maps a constants plugin', ->
      window = initWithCordovaPlugins {
        "constantsPlugin":
          TEMPORARY: 0
          PERSISTENT: 1
        "cordova/plugin_list": [
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
      }
      window.should.have.property('ConstantsPlugin').be.an 'object'
      window.should.have.property 'TEMPORARY'
      window.should.have.property 'PERSISTENT'
