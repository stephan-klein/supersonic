describe 'supersonic.module.transitions', ->
  it 'is an object', ->
    supersonic.module.should.have.property('transitions').be.an 'object'

  describe 'push', ->
    it 'is a function', ->
      supersonic.module.transitions.should.have.property('push').be.a 'function'

    ###
    NOTE: This doesn't work in tests, find out why!
    ###
    it.skip 'applies a transition and returns a promise on its completion', ->
      supersonic.module.transitions.push().should.be.fulfilled

  describe 'pop', ->
    it 'is a function', ->
      supersonic.module.transitions.should.have.property('pop').be.a 'function'

    ###
    NOTE: This doesn't work in tests, find out why!
    ###
    it.skip 'applies a transition and returns a promise on its completion', ->
      supersonic.module.transitions.pop().should.be.fulfilled
