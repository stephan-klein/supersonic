chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

prompt = require('../../../src/supersonic/core/ui/dialog/prompt')

describe "supersonic.ui.dialog.prompt", ->
  it "should exist", ->
    prompt.should.exist
