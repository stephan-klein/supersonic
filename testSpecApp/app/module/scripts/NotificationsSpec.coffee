describe 'supersonic.module.notifications', ->
  it 'should be defined', ->
    supersonic.module
      .should.have.property('notifications')
      .be.an 'object'
