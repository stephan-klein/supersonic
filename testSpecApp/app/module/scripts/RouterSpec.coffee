describe 'supersonic.module.router', ->
  it 'is an object', ->
    supersonic.module.should.have.property('router').be.an 'object'

  describe 'getPath', ->
    it 'is a function', ->
      supersonic.module.router.should.have.property('getPath').be.a 'function'
