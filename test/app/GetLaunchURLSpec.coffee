chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
getLaunchURL = require('../../src/supersonic/app/getLaunchURL')(steroids)

describe "supersonic.app.getLaunchURL", ->
  it "should exist", ->
    getLaunchURL.should.exist
