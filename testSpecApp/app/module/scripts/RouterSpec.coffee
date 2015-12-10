describe 'supersonic.module.router', ->
  it 'is an object', ->
    supersonic.module.should.have.property('router').be.an 'object'

  describe 'interpret', ->
    it 'is a function', ->
      supersonic.module.router.should.have.property('interpret').be.a 'function'

    it 'takes a route string and output its raw components', ->
      supersonic.module.router.interpret('foo#bar?qux=baz').should.deep.equal {
        moduleName: 'foo'
        viewName: 'bar'
        query:
          qux: 'baz'
      }

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

  describe 'getMapping', ->

    it 'is a function', ->
      supersonic.module.router.should.have.property('getMapping').be.a 'function'

    it 'maps a route name and attributes to its components', ->
      supersonic.env.modules ?= {}
      supersonic.env.modules.routes =
        foo:
          views:
            index:
              path: "bar"

      mapping = supersonic.module.router.getMapping 'foo'

      mapping.should.have.property('path').equal 'bar'
      mapping.should.have.property('uid').equal 'foo'
      mapping.should.have.property('attributes').deep.equal {}

    describe 'uid', ->
      it 'is the same as a passed route name', ->
        supersonic.env.modules ?= {}
        supersonic.env.modules.routes =
          foo:
            views:
              index:
                path: "bar"

        supersonic.module.router.getMapping('foo').uid.should.equal 'foo'

      it 'is the same as a passed view', ->
        supersonic.module.router.getMapping('#view').uid.should.equal '#view'

    describe 'attributes', ->
      it 'can be explicit', ->
        supersonic.module.router
          .getMapping('#view', foo: 'bar')
          .attributes
          .should.deep.equal {
            foo: 'bar'
          }

      it 'can be detected from the route', ->
        supersonic.module.router
          .getMapping('#view?foo=bar')
          .attributes
          .should.deep.equal {
            foo: 'bar'
          }
