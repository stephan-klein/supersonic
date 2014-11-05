describe "supersonic.data.autoupdate", ->
  it "is a function", ->
    supersonic.data.autoupdate.should.be.a 'function'

  it "accepts a listener that is called 'at suitable intervals'", ->
    new Promise((resolve) ->
      supersonic.data.autoupdate resolve
    ).should.be.fulfilled

  it "should not trigger on current tick", ->
    triggered = false
    supersonic.data.autoupdate ->
      triggered = true
    triggered.should.be.false
