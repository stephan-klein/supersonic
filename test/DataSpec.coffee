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
  describe "model", ->
    it "should be a function", ->
      data().model.should.be.a 'function'

  describe "when no resources are configured", ->
    describe "model", ->
      it "should always fail", ->
        (-> data().model 'foo').should.throw Error, /no cloud resources/i

  it "accepts a resource bundle from window.ag.data", ->
    data({})

  describe "when the resource bundle is empty", ->
    describe "model", ->
      it "should always fail", ->
        (-> data({}).model 'foo').should.throw Error, /could not be loaded/i

  describe "when the resource bundle has a resource", ->
    describe "model", ->
      it "should return a Model class", ->
        data({
          options:
            baseUrl: "http://example.com"
          resources:
            foo: schema: fields: bar: {}
        })
        .model('foo')
        .should.include.keys ['find', 'findAll']
