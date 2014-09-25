describe 'supersonic.angular.supersonic', ->

  beforeEach module 'supersonic'

  it 'should be accessible as an angular-injected service', inject (supersonic) ->
    supersonic.should.be.an.object
