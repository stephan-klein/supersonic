Promise = require 'bluebird'
Bacon = require 'baconjs'

chai = require('chai')
chai.should()
chai.use require 'chai-as-promised'

window = require '../src/supersonic/mock/window'
steroids = require '../src/supersonic/mock/steroids'
logger = require('../src/supersonic/core/logger')(steroids, window)
superify = require '../src/supersonic/core/superify'

describe "supersonic.superify", ->
  it "is a function", ->
    superify.should.be.a 'function'

  it 'accepts a namespace and a logger', ->
    superify('ns', logger).should.be.an 'object'

  describe 'promiseF', ->
    s = null
    beforeEach ->
      s = superify 'ns', logger

    it 'is a function', ->
      s.promiseF.should.be.a 'function'

    it 'accepts a name and a function', ->
      s.promiseF('foo', ->).should.be.a 'function'

    it 'allows a promise from the function to fall through', ->
      s.promiseF('foo', ->
        Promise.resolve 'value'
      )().should.eventually.equal 'value'

    it 'hooks up onSuccess argument from last parameter', (done) ->
      s.promiseF('foo', ->
        Promise.resolve 'value'
      )({
        onSuccess: (v) ->
          v.should.equal 'value'
          done()
      })

    it 'passes args as they are to the function if there are no callbacks', ->
      s.promiseF('foo', (one, two) ->
        new Promise (resolve) ->
          [one, two].should.deep.equal ['one', 'two']
          resolve()
      )('one', 'two')

    it 'does not pass last arg to function if there are callbacks', (done) ->
      s.promiseF('foo', (one, two) ->
        new Promise (resolve) ->
          [one, two].should.deep.equal ['one', undefined]
          resolve()
      )('one', {
        onSuccess: done
        onFailure: done
      })

  describe 'streamF', ->
    s = null
    beforeEach ->
      s = superify 'ns', logger

    it 'is a function', ->
      s.streamF.should.be.a 'function'

    it 'accepts a name and a function', ->
      s.streamF('foo', ->).should.be.a 'function'

    it 'allows a stream from the function to fall through', ->
      new Promise((resolve) ->
        s.streamF('foo', ->
          Bacon.once 'value'
        )().onValue resolve
      ).should.eventually.equal 'value'

    it 'hooks up onSuccess argument from last parameter', ->
      new Promise((resolve) ->
        s.streamF('foo', ->
          Bacon.once 'value'
        )({
          onSuccess: resolve
        })
      ).should.eventually.equal 'value'

    it 'passes args as they are to the function if there are no callbacks', ->
      new Promise((resolve) ->
        s.streamF('foo', (one, two) ->
          Bacon.once [one, two]
        )('one', 'two').onValue resolve
      ).should.eventually.deep.equal ['one', 'two']

    it 'does not pass last arg to function if there are callbacks', ->
      new Promise((resolve) ->
        s.streamF('foo', (one, two) ->
          Bacon.once [one, two]
        )('one', {
          onSuccess: resolve
        })
      ).should.eventually.deep.equal ['one', undefined]
