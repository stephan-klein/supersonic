chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())
screen = require('../../src/supersonic/core/ui/screen')(steroids, logger)

describe "supersonic.ui.screen.setAllowedRotations", ->
  it "should exist", ->
    screen.setAllowedRotations.should.exist

describe "supersonic.ui.screen.rotateTo", ->
  it "should exist", ->
    screen.rotateTo.should.exist
