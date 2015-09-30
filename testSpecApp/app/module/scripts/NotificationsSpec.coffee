describe 'supersonic.module.notifications', ->
  it 'should be defined', ->
    supersonic.module
      .should.have.property('notifications')
      .be.an 'object'

  describe 'announcer()', ->
    it 'is a function', ->
      supersonic.module.notifications
        .should.have.property('announcer')
        .be.a 'function'

    it 'requires a namespace', ->
      (-> supersonic.module.notifications.announcer())
        .should.throw Error

    it 'requires a list of events', ->
      (-> supersonic.module.notifications.announcer('namespace', events: []))
        .should.throw Error
