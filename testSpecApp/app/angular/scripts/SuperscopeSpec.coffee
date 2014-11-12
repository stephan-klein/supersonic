watchNextValue = (scope, watchExpression, timeout=1000, skipInitialDigest=true) ->
  unregister = null
  new Promise((resolve, reject) ->
    unregister = scope.$watch watchExpression, (newValue, oldValue) ->
      # see https://docs.angularjs.org/api/ng/type/$rootScope.Scope
      #
      # After a watcher is registered with the scope, the listener fn is called
      # asynchronously (via $evalAsync) to initialize the watcher.
      # In rare cases, this is undesirable because the listener is called when
      # the result of watchExpression didn't change. To detect this scenario
      # within the listener fn, you can compare the newVal and oldVal.
      # If these two values are identical (===) then the listener was called due
      # to initialization."
      return if skipInitialDigest and (newValue == oldValue)

      if newValue?
        resolve newValue
      else
        reject new Error 'no value'
  ).timeout(timeout).finally unregister

describe 'supersonic.angular.superscope', ->
  beforeEach module 'supersonic.superscope'
  afterEach (done) ->
    inject (superscope) ->
      superscope.clear()
      # Let angular do its magic for this tick
      setTimeout done, 100

  it 'should be accessible as an angular-injected service', (done)->
    inject (superscope) ->
      superscope.should.be.an.object
      done()

  it 'can be $watched', (done) ->
    inject (superscope) ->
      watchNextValue(superscope, 'foo', 1000, false).should.eventually.equal('this-should-get-watched').and.notify done

      superscope.$apply ->
        superscope.foo = 'this-should-get-watched'

  it 'is isolated from rootScope', (done) ->
    inject ($rootScope, superscope) ->
      watchNextValue(superscope, 'foo', 1000, false).should.be.rejected.and.notify done
      $rootScope.$apply ->
        $rootScope.foo = 'this-should-not-get-watched'

  it 'is a singleton instance', (done)->
    Promise.join(
      new Promise (resolve) ->
        inject (superscope) ->
          resolve superscope
      new Promise (resolve) ->
        inject (superscope) ->
          resolve superscope
    ).spread (first, second) ->
      first.should.equal second
      done()

  describe 'cross-view state', ->
    startedView = null
    childViewId = 'angular#superscope/watch-foo-emit-bar'

    beforeEach (done) ->
      @timeout 25000

      resolve = (view)->
        startedView = view
        done()

      supersonic.ui.views.find(childViewId).then (view)->
        view.isStarted().then (started)->
          if started
            view.stop().then ->
              view.start()
          else
            view.start()
        .then ()->
          setTimeout ->
            resolve(view)
          , 2000 # wait for child view dom

    afterEach (done) ->
      supersonic.ui.views.stop(childViewId)
      .then ->
        startedView = null
        done()
      .catch (error)->
        console.log error.message
        done()

    it 'can be watched in another view', (done) ->
      @timeout 25000
      inject (superscope) ->
        message = "#{Math.random()}"
        watchNextValue(superscope, 'bar', 25000).should.eventually.equal(message).and.notify done
        superscope.$apply ->
          superscope.foo = message
