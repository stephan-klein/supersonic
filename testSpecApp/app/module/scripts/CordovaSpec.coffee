describe 'supersonic.module.cordovaSupport', ->

  it 'maps the cordova global var', ->
    window.should.have.property('cordova').be.an 'object'

  it 'maps the steroids global var', ->
    window.should.have.property('steroids').be.an 'object'
