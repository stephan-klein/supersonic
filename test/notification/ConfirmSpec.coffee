chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

confirm = require('../../src/supersonic/core/notification/confirm')

describe "supersonic.notification.confirm", ->
  it "should exist", ->
    confirm.should.exist