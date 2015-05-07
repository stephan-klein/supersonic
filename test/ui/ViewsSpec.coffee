chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())
views = require('../../src/supersonic/core/ui/views')(steroids, logger, new Window())

describe "supersonic.ui.views", ->
  it "should be an object", ->
    views.should.be.an 'object'

describe "supersonic.ui.views.current", ->
  it "should be an object", ->
    views.current.should.be.an 'object'
