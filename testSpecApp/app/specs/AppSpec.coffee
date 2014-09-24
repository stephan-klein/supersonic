expect = window.chai.expect
window.chai.should()

describe "supersonic.app.getLaunchURL", ->
  it "should be defined", ->
    supersonic.app.getLaunchURL.should.exist

  it "should be rejected", ->
    supersonic.app.getLaunchURL().should.be.rejected

describe "supersonic.app.sleep", ->
  it "should be defined", ->
    supersonic.app.sleep.should.exist

  # TODO: Can we find out disabled/enabled status so we can assert whether that status changes?

  it "should disable sleep", ->
    supersonic.app.sleep.disable().should.be.fulfilled

  it "should enable sleep", ->
    supersonic.app.sleep.enable().should.be.fulfilled

describe "supersonic.app.splashscreen", ->
  it "should be defined", ->
    supersonic.app.splashscreen.should.exist

  # TODO: Can we find out splashscreen shown/hidden status so we can assert whether that changes?

  it "should show splashscreen", ->
    supersonic.app.splashscreen.show().should.be.fulfilled

  it "should hide splashscreen", ->
    @timeout 5000
    supersonic.app.splashscreen.hide().should.be.fulfilled

describe "supersonic.app.openURL", ->
  it "should be defined", ->
    supersonic.app.openURL.should.exist

  it "should open Apple Maps", ->
    @timeout 10000

    url = "maps://?daddr=San+Francisco,+CA&saddr=cupertino"

    supersonic.app.openURL(url).should.be.fulfilled

  it "should not open dolanz://", ->
    supersonic.app.openURL("dolanz://").should.be.rejected

  it "should not open null", ->
    supersonic.app.openURL(null).should.be.rejected

describe "supersonic.app.statusBar", ->
  it "should be defined", ->
    supersonic.app.statusBar.should.exist

  # TODO: Can we find out statusBar shown/hidden status so we can assert whether that changes?

  describe "hide", ->
    beforeEach ->
      supersonic.app.statusBar.show()

    it "should hide status bar when the status bar is visible", ->
      supersonic.app.statusBar.hide().should.be.fulfilled

  describe "show", ->
    beforeEach ->
      supersonic.app.statusBar.hide()

    describe "when the status bar is not visible", ->
      it "should show status bar", ->
        supersonic.app.statusBar.show().should.be.fulfilled

      it "should show status bar with a string param", ->
        supersonic.app.statusBar.show("light").should.be.fulfilled

      it "should show status bar with an object param", ->
        supersonic.app.statusBar.show(style: "light").should.be.fulfilled

