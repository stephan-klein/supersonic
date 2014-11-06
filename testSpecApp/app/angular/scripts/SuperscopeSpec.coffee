describe 'supersonic.angular.superscope', ->
  beforeEach module 'supersonic.superscope'
  it 'should be accessible as an angular-injected service', inject (superscope) ->
    superscope.should.be.an.object

  it 'can be $watched', (done) ->
    inject (superscope) ->
      superscope.foo = 'bar'
      new Promise((resolve) ->
        superscope.$watch 'foo', resolve
      ).should.eventually.equal('bar').and.notify done
