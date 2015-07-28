chai = require('chai')
chai.should()

steroids = require '../../src/supersonic/mock/steroids'
Window = require '../../src/supersonic/mock/window'
logger = require('../../src/supersonic/core/logger')(steroids, new Window())
router = require('../../src/supersonic/core/module/router')(logger)

describe 'supersonic.module.router', ->
  it 'is an object', ->
    router.should.be.an 'object'

  describe 'getPath()', ->
    it 'is a function', ->
      router.should.have.property('getPath').be.a 'function'

    it 'requires a string', ->
      (-> router.getPath()).should.throw Error

    it 'returns a path to a module view when given a route', ->
      router.getPath('foo').should.match /\/foo\//

    it 'appends an object as query parameters', ->
      router.getPath('foo', bar: 'qux').should.match /\?bar=qux/

  describe 'route', ->
    it 'may have query parameters', ->
      router.getPath('foo?bar=qux').should.match /\?bar=qux/

    it 'may be parametrized with a view name', ->
      router.getPath('foo#bar').should.match /foo\/bar/

    describe 'view name', ->
      it 'defaults to "index"', ->
        router.getPath('foo').should.match /foo\/index/

      it 'has a default suffix of ".html"', ->
        router.getPath('foo').should.match /index\.html/

  describe 'root path', ->
    it 'defaults to /components', ->
      router.getPath('foo').should.match /^\/components/

