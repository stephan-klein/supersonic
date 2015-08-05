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

    nullDriver =
      layers:
        push: ->
        pop: ->

    afterEach ->
      supersonic.module.drivers.current.set(supersonic.module.drivers.mpa)

    describe 'set', ->
      it 'sets the current driver', ->
        supersonic.module.drivers.current.set(nullDriver)
        supersonic.module.drivers.current.get().should.equal nullDriver

    it 'is stored in the main frame', ->
      supersonic.module.drivers.current.set(nullDriver)
      nullDriver.should.equal window.top.ag?.module?.driver
