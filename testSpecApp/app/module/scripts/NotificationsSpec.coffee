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


          describe 'record_id and record_type', ->
            describe 'without CRUD context', ->
              it 'has empty record_id and record_type', ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .then (notification) ->
                    notification.should.not.have.property('record_id')
                    notification.should.not.have.property('record_type')

            describe 'with CRUD resource type context', ->
              before ->
                supersonic.module.attributes.set 'record-type', 'foo'

              it 'should have record_type set', ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .then (notification) ->
                    notification.should.not.have.property('record_id')
                    notification.should.have.property('record_type').equal 'foo'

              after ->
                supersonic.module.attributes.set 'record-type', null

            describe 'with CRUD resource type and record id context', ->
              before ->
                supersonic.module.attributes.set 'record-type', 'foo'
                supersonic.module.attributes.set 'record-id', '123abcdef'

              it 'has record_id and record_type guessed from attributes', ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .then (notification) ->
                    notification.should.have.property('record_id').equal '123abcdef'
                    notification.should.have.property('record_type').equal 'foo'

              after ->
                supersonic.module.attributes.set 'record-type', null
                supersonic.module.attributes.set 'record-id', null

          describe 'owner_user_id', ->
            it 'is set when there is a valid session', ->
              supersonic.module.notifications.announcer('namespace', events: ['changed'])
                .changed('stuff')
                .should.eventually.have.property('owner_user_id')
                .equal supersonic.auth.session.getUserId()

          describe 'related_record_type and related_record_id', ->
            it 'is set when an object with type and id is passed', ->
              supersonic.module.notifications.announcer('namespace', events: ['changed'])
                .changed('stuff', {
                  related:
                    id: '123abcdef'
                    type: 'foo'
                })
                .then (notification) ->
                  notification.should.have.property('related_record_id').equal '123abcdef'
                  notification.should.have.property('related_record_type').equal 'foo'
