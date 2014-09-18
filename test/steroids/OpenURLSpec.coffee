chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
openURL = require('../../src/supersonic/steroids/openURL')(steroids)

describe "supersonic.steroids.openURL", ->
  it "should exist", ->
    openURL.should.exist
