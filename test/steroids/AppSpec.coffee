chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
app = require('../../src/supersonic/steroids/app')(steroids)

describe "supersonic.steroids.app.splashscreen.show", ->
  it "should exist", ->
    app.splashscreen.show.should.exist

 describe "supersonic.steroids.app.splashscreen.hide", ->
  it "should exist", ->
    app.splashscreen.hide.should.exist

 describe "supersonic.steroids.app.openURL", ->
  it "should exist", ->
    app.openURL.should.exist
