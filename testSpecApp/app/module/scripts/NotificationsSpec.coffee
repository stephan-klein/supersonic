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

    it 'returns an announcer object', ->
      supersonic.module.notifications.announcer('namespace', events: ['changed'])
        .should.be.an 'object'

    describe 'announcer', ->
      it 'has a method for every event', ->
        events = [
          'food'
          'bard'
          'quxed'
        ]
        announcer = supersonic.module.notifications.announcer('namespace', { events })
        for eventName in events
          announcer[eventName].should.be.a 'function'

      describe 'each event method', ->
        it 'requires a message', ->
          supersonic.module.notifications.announcer('namespace', events: ['changed'])
            .changed()
            .should.be.rejected

        it 'resolves to a created notification', ->
          supersonic.module.notifications.announcer('namespace', events: ['changed'])
            .changed('this is what happened')
            .should.eventually.have.property('message')
            .equal 'this is what happened'

        describe 'each created notification', ->
          it 'has a type with the namespace and event', ->
            supersonic.module.notifications.announcer('namespace', events: ['changed'])
              .changed('stuff')
              .should.eventually.have.property('type')
              .match /namespace:changed/
