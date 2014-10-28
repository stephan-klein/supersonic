describe "supersonic.ui.dialog.alert", ->
  it "should be defined", ->
    supersonic.ui.dialog.alert.should.exist

  it "should present an alert", ->
    supersonic.ui.dialog.alert().should.be.fulfilled

  it "should present an alert with null params", ->
    supersonic.ui.dialog.alert(null).should.be.fulfilled

  it "should present an alert with custom title", ->
    supersonic.ui.dialog.alert("Custom Title").should.be.fulfilled

  it "should present an alert with title string and options object as params", ->

    title = "I'm an alert!"
    options =
      message: "Custom message"
      buttonLabel: "Close"

    supersonic.ui.dialog.alert(title, options).should.be.fulfilled
