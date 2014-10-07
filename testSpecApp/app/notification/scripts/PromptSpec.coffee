describe "supersonic.notification.prompt", ->
  it "should be defined", ->
    supersonic.notification.prompt.should.exist

  it "should present a prompt", ->
    supersonic.notification.prompt().should.be.fulfilled

  it "should present a prompt with null params", ->
    supersonic.notification.prompt(null).should.be.fulfilled

  it "should present a prompt with title as param", ->
    supersonic.notification.prompt("Please type").should.be.fulfilled

  it "should present a prompt with title string and options object params", ->
    options =
      message: "Custom Title"
      buttonLabels: ["Yay","NO!"]
      defaultText: "Default text"

    supersonic.notification.prompt("I'm a Custom Prompt!", options).should.be.fulfilled
