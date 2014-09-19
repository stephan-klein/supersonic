chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/steroids.mock'
statusBar = require('../../src/supersonic/app/statusBar')(steroids)

describe "supersonic.app.statusBar.show", ->
  it "should exist", ->
    statusBar.show.should.exist

describe "supersonic.app.statusBar.hide", ->
  it "should exist", ->
    statusBar.hide.should.exist
