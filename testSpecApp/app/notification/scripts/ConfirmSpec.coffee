describe "supersonic.notification.confirm", ->
  it "should be defined", ->
    supersonic.notification.confirm.should.exist

  it "should present a confirm", ->
    supersonic.notification.confirm().should.be.fulfilled

  it "should present a confirm with null params", ->
    supersonic.notification.confirm(null).should.be.fulfilled

  it "should present a confirm with message as param", ->
    supersonic.notification.confirm("What up?").should.be.fulfilled

  it "should present a confirm with messsage and options params", ->
    options =
      title: "Custom Title"
      buttonLabels: ["Yay","NO!","third"]

    supersonic.notification.confirm("I'm a Custom Confirm!", options).should.be.fulfilled
