Promise = supersonic.internal.Promise

withContextAttributes = (attrs, f) ->
  previousAttrs = {}
  for key, value of attrs
    previousAttrs[key] = supersonic.module.attributes.get key
    supersonic.module.attributes.set key, value

  Promise.resolve(f()).finally ->
    for key, value of previousAttrs
      supersonic.module.attributes.set key, value

withDefaultContext = (f) ->
  withContextAttributes {
    'record-type': 'default-record-type'
    'record-id': 'default-record-id-123'
  }, f

withoutContext = (f) ->
  withContextAttributes {
    'record-type': null
    'record-id': null
  }, f

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

      describe 'backwards compatibility', ->
        it 'will not fail synchronously if the resource dependency does not exist', ->
          withDefaultContext ->
            (->
              supersonic.module.notifications.announcer('namespace',
                events: ['changed']
                resourceName: 'ThisResourceDoesNotExist'
              )
            ).should.not.throw Error

      describe 'each event method', ->
        it 'requires a message', ->
          withDefaultContext ->
            supersonic.module.notifications.announcer('namespace', events: ['changed'])
              .changed()
              .should.be.rejected

        it 'resolves to a created notification', ->
          withDefaultContext ->
            supersonic.module.notifications.announcer('namespace', events: ['changed'])
              .changed('this is what happened')
              .should.eventually.have.property('message')
              .equal 'this is what happened'

        describe 'each created notification', ->
          it 'has a type with the namespace and event', ->
            withDefaultContext ->
              supersonic.module.notifications.announcer('namespace', events: ['changed'])
                .changed('stuff')
                .should.eventually.have.property('type')
                .match /namespace:changed/

          describe 'record_id and record_type', ->
            describe 'without CRUD context', ->
              it 'has empty record_id and record_type', ->
                withoutContext ->
                  supersonic.module.notifications.announcer('namespace', events: ['changed'])
                    .changed('stuff',
                      route:
                        view: 'data.AppGyverNotifications'
                    )
                    .then (notification) ->
                      notification.should.not.have.property('record_id')
                      notification.should.not.have.property('record_type')

            describe 'with CRUD resource type context', ->
              it 'should have record_type set', ->
                withContextAttributes {
                  'record-type': 'foo'
                }, ->
                  supersonic.module.notifications.announcer('namespace', events: ['changed'])
                    .changed('stuff')
                    .then (notification) ->
                      notification.should.not.have.property('record_id')
                      notification.should.have.property('record_type').equal 'foo'

            describe 'with CRUD resource type and record id context', ->
              it 'has record_id and record_type guessed from attributes', ->
                withContextAttributes {
                  'record-type': 'foo'
                  'record-id': '123abcdef'
                }, ->
                  supersonic.module.notifications.announcer('namespace', events: ['changed'])
                    .changed('stuff')
                    .then (notification) ->
                      notification.should.have.property('record_id').equal '123abcdef'
                      notification.should.have.property('record_type').equal 'foo'


          describe 'owner_user_id', ->
            it 'is set when there is a valid session', ->
              withDefaultContext ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .should.eventually.have.property('owner_user_id')
                  .equal supersonic.auth.session.getUserId()

          describe 'related_record_type and related_record_id', ->
            it 'is set when an object with type and id is passed', ->
              withDefaultContext ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff', {
                    related:
                      id: '123abcdef'
                      type: 'foo'
                  })
                  .then (notification) ->
                    notification.should.have.property('related_record_id').equal '123abcdef'
                    notification.should.have.property('related_record_type').equal 'foo'


          describe 'route and route_params', ->

            it 'can be set by passing a route object', ->
              withoutContext ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff', {
                    route:
                      view: 'data.AppGyverNotifications'
                      params:
                        foo: true
                  })
                  .then (notification) ->
                    notification.should.have.property('route').equal 'data.AppGyverNotifications'
                    notification.should.have.property('route_params').deep.equal {
                      foo: true
                    }

            it 'is mandatory when record_type and record_id are not set', ->
              withoutContext ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .should.be.rejected

            it 'gets set to CRUD index view when record_type is set', ->
              withContextAttributes {
                'record-type': 'foo'
              }, ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .then (notification) ->
                    notification.should.have.property('route').equal 'data.foo'

            it 'gets set to CRUD show view when record_type and record_id are set', ->
              withContextAttributes {
                'record-type': 'foo'
                'record-id': '123abcdef'
              }, ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff')
                  .then (notification) ->
                    notification.should.have.property('route').equal 'data.foo.show'
                    notification.should.have.property('route_params').deep.equal {
                      id: '123abcdef'
                    }

          describe 'target_user_ids', ->

            it 'can be set by passing a list of receivers', ->
              withDefaultContext ->
                supersonic.module.notifications.announcer('namespace', events: ['changed'])
                  .changed('stuff',
                    receivers: [supersonic.auth.session.getUserId()]
                  )
                  .should.eventually.have.property('target_user_ids')
                  .deep.equal [supersonic.auth.session.getUserId()]
