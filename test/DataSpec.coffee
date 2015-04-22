chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

Promise = require 'bluebird'
steroids = require '../src/supersonic/mock/steroids'
window = require '../src/supersonic/mock/window'
logger = require('../src/supersonic/core/logger')(steroids, window)

data = (resourceBundle = null) ->
  require('../src/supersonic/core/data')(logger, {
    ag: data: resourceBundle
  })

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

    describe "with default options", ->
      it "should have authorization header", ->
        model = data(mockResourceBundle)
          .model('foo', {
            storage: {
              getItem: (item) ->
                if item is "__ag:auth:access_token"
                  Promise.resolve 'here is the token'
                else
                  Promise.reject()
            }
          })

        model
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
