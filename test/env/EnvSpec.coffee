chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())

describe "supersonic.env without a storage", ->
  env = require('../../src/supersonic/core/env')(logger, new Window())

  it "should exist", ->
    env.should.exist

  it "should return mostly nothing", ->
    env.mode.should.equal("legacy")

describe "supersonic.env with a storage", ->
  betterWindow = new Window()
  betterWindow.appgyver =
    environment:
      mode: "better"

  env = require('../../src/supersonic/core/env')(logger, betterWindow)

  it "should exist", ->
    env.should.exist

  it "should return what's in the storage", ->
    env.mode.should.equal("better")
