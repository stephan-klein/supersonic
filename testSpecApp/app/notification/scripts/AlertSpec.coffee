describe "supersonic.notification.alert", ->
  it "should be defined", ->
    supersonic.notification.alert.should.exist

  it "should present an alert", ->
    supersonic.notification.alert().should.be.fulfilled

  it "should present an alert with null params", ->
    supersonic.notification.alert(null).should.be.fulfilled

  it "should present an alert with custom message", ->
    supersonic.notification.alert("Custom").should.be.fulfilled

  it "should present an alert with message string and options object as params", ->
    options =
      title: "Custom Title"
      buttonLabel: "Close"

    supersonic.notification.alert("I'm an alert!", options).should.be.fulfilled
