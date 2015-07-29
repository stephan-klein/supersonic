describe 'supersonic.module.layers', ->
  it 'is an object', ->
    supersonic.module.should.have.property('layers').be.an 'object'

  describe 'push', ->
    it 'is a function', ->
      supersonic.module.layers.should.have.property('push').be.a 'function'

    it 'pushes a view matching the given route', ->
      supersonic.env.modules ?= {}
      supersonic.env.modules.routes =
        foo:
          views:
            index:
              path: "app/module/will-pop-immediately.html"

      supersonic.module.layers.push('foo').should.be.fulfilled
