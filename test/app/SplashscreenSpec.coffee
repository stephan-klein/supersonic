chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
splashscreen = require('../../src/supersonic/app/splashscreen')(steroids)

describe "supersonic.app.splashscreen.show", ->
  it "should exist", ->
    splashscreen.show.should.exist

describe "supersonic.app.splashscreen.hide", ->
  it "should exist", ->
    splashscreen.hide.should.exist
