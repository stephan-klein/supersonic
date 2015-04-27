chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

Promise = require 'bluebird'
Bacon = require 'baconjs'

steroids = require '../src/supersonic/mock/steroids'
window = require '../src/supersonic/mock/window'
logger = require('../src/supersonic/core/logger')(steroids, window)

data = (resourceBundle = null) ->
  globalsWithResourceBundle = {
    ag:
      data: resourceBundle
  }
  asyncStorageAdapter = require('../src/supersonic/core/data/storage/adapters').memory
  syncStorageAdapter = ->
    property: (name) ->
      values: null

  model = require('../src/supersonic/core/data/model')(
    logger
    globalsWithResourceBundle
    asyncStorageAdapter
    syncStorageAdapter
  )

  return {
    model
  }

describe "supersonic.data", ->

  mockResourceBundle =
    options:
      baseUrl: "http://example.com"
    resources:
      foo: schema: fields: bar: {}

  it "accepts a resource bundle from window.ag.data", ->
    (->
      data(mockResourceBundle)
    ).should.not.throw

  describe "model", ->

    it "should be a function", ->
      data().model.should.be.a 'function'

    describe "default options", ->
      it "should have authorization header if it's set in the session", ->
        d = data(mockResourceBundle)
        d.session.set {
          accessToken: 'here is the token'
        }

        d
          .model('foo')
          .resource
          .getOptions()
          .should
            .have.property("headers")
            .deep.equal {
              Authorization: 'here is the token'
            }

      it "should have cache enabled", ->
        data(mockResourceBundle)
          .model('foo')
          .resource
          .should.have.property('cache')

    describe "when no resources are configured", ->
      it "should always fail", ->
        (-> data().model 'foo').should.throw Error, /no cloud resources/i

    describe "when the resource bundle is empty", ->
      it "should always fail", ->
        (-> data({}).model 'foo').should.throw Error, /could not load(.*)bundle/i

    describe "when the resource bundle has a resource", ->
      it "should return a Model class", ->
        data(mockResourceBundle)
        .model('foo')
        .should.include.keys ['find', 'findAll']

    describe "when a resource by the given name has not been defined", ->
      it "should fail", ->
        (->
          data(mockResourceBundle)
          .model('bar')
        ).should.throw Error, /could not load model/i
