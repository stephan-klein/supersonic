chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

prompt = require('../../src/supersonic/notification/prompt')

describe "supersonic.notification.prompt", ->
  it "should exist", ->
    prompt.should.exist