
waitForLayerChange = ->
  new Promise (resolve) ->
    listener = window.top.steroids.layers.on "didchange", ->
      window.top.steroids.layers.off "didchange", listener
      resolve()

describe 'supersonic.module.layers', ->
  it 'is an object', ->
    supersonic.module.should.have.property('layers').be.an 'object'

  before ->
    supersonic.env.modules ?= {}
    supersonic.env.modules.routes =
      foo:
        views:
          index:
            path: "app/module/empty.html"

  describe 'push', ->
    it 'is a function', ->
      supersonic.module.layers.should.have.property('push').be.a 'function'

  describe 'pop', ->
    it 'is a function', ->
      supersonic.module.layers.should.have.property('pop').be.a 'function'

  describe 'navigation between views', ->

    it 'can push a view matching a given route and can pop it afterwards', ->
      supersonic.module.layers.push('foo')
        .then(waitForLayerChange)
        .then(supersonic.module.layers.pop)
        .then(waitForLayerChange)
        .should.be.fulfilled
