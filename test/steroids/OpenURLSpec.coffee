chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

openURL = require('../../src/supersonic/steroids/openURL')

describe "supersonic.steroids.openURL", ->
  it "should exist", ->
    openURL.should.exist
