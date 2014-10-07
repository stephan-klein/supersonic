describe "supersonic.notification.alert", ->
  it "should be defined", ->
    supersonic.notification.alert.should.exist

  it "should present an alert", ->
    supersonic.notification.alert().should.be.fulfilled

  it "should present an alert with null params", ->
    supersonic.notification.alert(null).should.be.fulfilled

  it "should present an alert with custom title", ->
    supersonic.notification.alert("Custom Title").should.be.fulfilled

  it "should present an alert with title string and options object as params", ->

    title = "I'm an alert!"
    options =
      message: "Custom message"
      buttonLabel: "Close"

    supersonic.notification.alert(title, options).should.be.fulfilled
