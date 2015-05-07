chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())
geolocation = require('../../src/supersonic/core/device/geolocation')(steroids, logger)

describe "supersonic.device.geolocation", ->
  it "should exist", ->
    geolocation.should.exist

describe "supersonic.device.geolocation.watchPosition", ->
  it "should exist", ->
    geolocation.watchPosition.should.exist

describe "supersonic.device.geolocation.getPosition", ->
  it "should exist", ->
    geolocation.getPosition.should.exist
