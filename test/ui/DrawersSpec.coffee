chai = require('chai')
chai.should()
sinon = require 'sinon'
chai.use require 'sinon-chai'
chai.use require 'chai-as-promised'

global.steroids = require '../../src/supersonic/mock/steroids'
window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, window)
drawers = require('../../src/supersonic/core/ui/drawers')(steroids, logger)

describe "supersonic.ui.drawers", ->
  it "should exist", ->
    drawers.should.exist


  describe "events", ->
    unsubs = []
    will_show = null
    did_show = null
    will_close = null
    did_close = null

    it "should have whenWillShow", ->
      drawers.whenWillShow.should.exist
      will_show = sinon.spy()

      unsubs.push drawers.whenWillShow will_show

      steroids.__trigger_event "steroids.drawers.on", "willshow", {}

      will_show.should.have.been.calledOnce

    it "should have whenDidShow", ->
      drawers.whenDidShow.should.exist

      did_show = sinon.spy()
      unsubs.push drawers.whenDidShow did_show

      steroids.__trigger_event "steroids.drawers.on", "didshow", {}

      did_show.should.have.been.calledOnce

    it "should have whenWillClose", ->
      drawers.whenWillClose.should.exist
      will_close = sinon.spy()
      unsubs.push drawers.whenWillClose will_close

      steroids.__trigger_event "steroids.drawers.on", "willclose", {}
      will_close.should.have.been.calledOnce

    it "should have whenDidClose", ->
      drawers.whenDidClose.should.exist
      did_close = sinon.spy()
      unsubs.push drawers.whenDidClose did_close

      steroids.__trigger_event "steroids.drawers.on", "didclose", {}

      did_close.should.have.been.calledOnce

    it "should be able to remove listeners", ->
      unsub() for unsub in unsubs

      steroids.__trigger_event "steroids.drawers.on", "willshow", {}
      steroids.__trigger_event "steroids.drawers.on", "didshow", {}
      steroids.__trigger_event "steroids.drawers.on", "willclose", {}
      steroids.__trigger_event "steroids.drawers.on", "didclose", {}
      will_show.should.have.been.calledOnce
      did_show.should.have.been.calledOnce
      will_close.should.have.been.calledOnce
      did_close.should.have.been.calledOnce
