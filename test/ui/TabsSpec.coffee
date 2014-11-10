chai = require('chai')
chai.should()
sinon = require 'sinon'
chai.use require 'sinon-chai'
chai.use require 'chai-as-promised'

global.steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
tabs = require('../../src/supersonic/core/ui/tabs')(steroids, logger)

describe "supersonic.ui.tabs", ->
  it "should exist", ->
    tabs.should.exist


  describe "events", ->
    it "should exist", ->
      tabs.whenWillChange.should.exist
      tabs.whenDidChange.should.exist


    it "should trigger given function", ->
      will = sinon.spy()
      did = sinon.spy()
      another_will = sinon.spy()
      tabs.whenWillChange will
      tabs.whenDidChange did

      steroids.__trigger_event "steroids.tabBar.on", "willchange", {}
      steroids.__trigger_event "steroids.tabBar.on", "didchange", {}

      will.should.have.been.called
      did.should.have.been.called

      another_unsub = tabs.whenWillChange another_will
      another_will.should.not.have.been.called

      steroids.__trigger_event "steroids.tabBar.on", "willchange", {}
      another_will.should.have.been.calledOnce
      will.should.have.been.calledTwice
      did.should.have.been.calledOnce

      another_unsub()

      steroids.__trigger_event "steroids.tabBar.on", "willchange", {}

      will.should.have.been.calledThrice
      another_will.should.have.been.calledOnce
