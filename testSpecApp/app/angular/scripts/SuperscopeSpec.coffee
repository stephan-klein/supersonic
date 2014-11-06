describe 'supersonic.angular.superscope', ->
  beforeEach module 'supersonic.superscope'
  it 'should be accessible as an angular-injected service', inject (superscope) ->
    superscope.should.be.an.object

  it 'can be $watched', (done) ->
    inject (superscope) ->
      new Promise((resolve) ->
        superscope.$watch 'foo', resolve
      ).should.eventually.equal('bar').and.notify done
      superscope.$apply ->
        superscope.foo = 'bar'

  it 'is isolated from rootScope', (done) ->
    inject ($rootScope, superscope) ->
      (new Promise (resolve) ->
        superscope.$watch 'foo', resolve
      ).timeout(100).should.be.rejected.and.notify done
      $rootScope.$apply ->
        $rootScope.foo = 'bar'

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


