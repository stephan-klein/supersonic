describe 'supersonic.angular.superscope', ->
  beforeEach module 'supersonic.superscope'
  it 'should be accessible as an angular-injected service', inject (superscope) ->
    superscope.should.be.an.object
