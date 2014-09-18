chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
debug = require('../../src/supersonic/core/debug')(steroids)

describe "supersonic.core.debug", ->
  it "should have ping", ->
    debug.ping.should.exist
