describe 'supersonic.module.drivers', ->
  it 'is an object', ->
    supersonic.module.should.have.property('drivers').be.an 'object'

  describe 'mpa', ->
    it 'is an object', ->
      supersonic.module.drivers.should.have.property('mpa').be.an 'object'

  describe 'current', ->
    it 'is an object', ->
      supersonic.module.drivers.should.have.property('current').be.an 'object'

    describe 'get', ->
      it 'defaults to the mpa driver', ->
        supersonic.module.drivers.current.get().should.equal supersonic.module.drivers.mpa

    describe 'set', ->
      it 'sets the current driver', ->
        newDriver =
          layers:
            push: ->
            pop: ->

        supersonic.module.drivers.current.set(newDriver)
        supersonic.module.drivers.current.get().should.equal newDriver

      after ->
        supersonic.module.drivers.current.set(supersonic.module.drivers.mpa)
