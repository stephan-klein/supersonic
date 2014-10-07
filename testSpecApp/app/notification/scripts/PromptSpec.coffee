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
    title = "I'm a Custom Prompt!"
    options =
      message: "Custom Message"
      buttonLabels: ["Yay","NO!"]
      defaultText: "Default text"

    supersonic.notification.prompt(title, options).should.be.fulfilled
