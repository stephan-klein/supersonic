chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())
compass = require('../../src/supersonic/core/device/compass')(steroids, logger)

describe "supersonic.device.compass", ->
  it "should exist", ->
    compass.should.exist

describe "supersonic.device.compass.watchHeading", ->
  it "should exist", ->
    compass.watchHeading.should.exist

describe "supersonic.device.compass.getHeading", ->
  it "should exist", ->
    compass.getHeading.should.exist
