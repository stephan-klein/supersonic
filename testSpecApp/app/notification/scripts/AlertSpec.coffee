describe "supersonic.notification.alert", ->
  it "should be defined", ->
    supersonic.notification.alert.should.exist

  it "should present an alert", ->
    supersonic.notification.alert().should.be.fulfilled

  it "should present an alert with null params", ->
    supersonic.notification.alert(null).should.be.fulfilled

  it "should present an alert with custom string title", ->
    supersonic.notification.alert("Custom").should.be.fulfilled

  it "should present an alert with options object", ->
    options =
      title: "Custom Title"
      message: "I'm an alert!"
      buttonLabel: "Close"

    supersonic.notification.alert(options).should.be.fulfilled
