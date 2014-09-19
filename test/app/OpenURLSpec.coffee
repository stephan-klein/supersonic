chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
openURL = require('../../src/supersonic/app/openURL')(steroids)

describe "supersonic.app.openURL", ->
  it "should exist", ->
    openURL.should.exist
