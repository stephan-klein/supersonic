watchNextValue = (scope, watchExpression) ->
  unregister = null
  new Promise((resolve, reject) ->
    unregister = scope.$watch watchExpression, (value) ->
      if value?
        resolve value
      else
        reject new Error 'no value'
  ).timeout(100).finally unregister

describe 'supersonic.angular.superscope', ->
  beforeEach module 'supersonic.superscope'
  afterEach ->
    inject (superscope) ->
      superscope.clear()

  it 'should be accessible as an angular-injected service', inject (superscope) ->
    superscope.should.be.an.object

  it 'can be $watched', (done) ->
    inject (superscope) ->
      watchNextValue(superscope, 'foo').should.eventually.equal('this-should-get-watched').and.notify done
      superscope.$apply ->
        superscope.foo = 'this-should-get-watched'

  it 'is isolated from rootScope', (done) ->
    inject ($rootScope, superscope) ->
      watchNextValue(superscope, 'foo').should.be.rejected.and.notify done
      $rootScope.$apply ->
        $rootScope.foo = 'this-should-not-get-watched'

  it 'is a singleton instance', ->
    Promise.join(
      new Promise (resolve) ->
        inject (superscope) ->
          resolve superscope
      new Promise (resolve) ->
        inject (superscope) ->
          resolve superscope
    ).spread (first, second) ->
      first.should.equal second

  describe 'cross-view state', ->
    startedView = null
    beforeEach ->
      supersonic.ui.view('angular#superscope/watch-foo-emit-bar').start().then (view) ->
        startedView = view
    afterEach ->
      startedView.stop()

    it 'can be watched in another view', (done) ->
      inject (superscope) ->
        message = "#{Math.random()}"
        watchNextValue(superscope, 'bar').should.eventually.equal(message).and.notify done
        superscope.$apply ->
          superscope.foo = message


