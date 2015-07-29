describe 'supersonic.module.router', ->
  it 'is an object', ->
    supersonic.module.should.have.property('router').be.an 'object'

  describe 'getPath', ->
    it 'is a function', ->
      supersonic.module.router.should.have.property('getPath').be.a 'function'

    it 'reads supersonic.env.modules for route targets', ->
      supersonic.env.modules ?= {}
      supersonic.env.modules.routes =
        foo:
          views:
            index:
              path: "bar"

      supersonic.module.router.getPath('foo').should.equal "bar"
