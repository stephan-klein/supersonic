chai = require('chai')
chai.should()

steroids = require '../../src/supersonic/mock/steroids'
drivers = require('../../src/supersonic/core/module/drivers')(steroids, superglobal = {})

describe 'supersonic.module.drivers', ->
  it 'is an object', ->
    drivers.should.be.an 'object'

  describe 'current', ->
    it 'is an object', ->
      drivers.should.have.property('current').be.an 'object'

    describe 'set', ->
      it 'is a function', ->
        drivers.current.should.have.property('set').be.a 'function'

    describe 'get', ->
      it 'is a function', ->
        drivers.current.should.have.property('get').be.a 'function'

    it 'can be set and get', ->
      newDriver = {}

      drivers.current.set(newDriver)
      drivers.current.get().should.equal newDriver
