chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

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
