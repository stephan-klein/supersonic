chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
statusBar = require('../../src/supersonic/core/app/statusBar')(steroids, logger)

describe "supersonic.app.statusBar.show", ->
  it "should exist", ->
    statusBar.show.should.exist

describe "supersonic.app.statusBar.hide", ->
  it "should exist", ->
    statusBar.hide.should.exist
