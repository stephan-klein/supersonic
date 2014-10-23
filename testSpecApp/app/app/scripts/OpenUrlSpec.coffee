describe "supersonic.app.openURL", ->
  it "should be defined", ->
    supersonic.app.openURL.should.exist

  it "should open Apple Maps", (done)->
    @timeout 10000

    url = "maps://?daddr=San+Francisco,+CA&saddr=cupertino"

    supersonic.app.openURL(url).should.be.fulfilled

    document.addEventListener "resume", ->
      done()

  it "should not open dolanz://", ->
    supersonic.app.openURL("dolanz://").should.be.rejected

  it "should not open null", ->
    supersonic.app.openURL(null).should.be.rejected
