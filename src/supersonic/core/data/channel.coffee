Bacon = require 'baconjs'
deepEqual = require 'deep-equal'

module.exports = (window) ->

  # http://stackoverflow.com/a/8809472
  #TODO performance.now() instead of new Date.getTime();
  # window.performance IS REMOVED IN iOS 8.1
  generateUUID = ->
    d = new Date().getTime()
    uuid = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, (c) ->
      r = (d + Math.random() * 16) % 16 | 0
      d = Math.floor(d / 16)
      ((if c is "x" then r else (r & 0x7 | 0x8))).toString 16
    )
    uuid

  outboundBus = (channelName, sender) ->
    bus = new Bacon.Bus

    bus
      .map (message) ->
        channel: channelName
        sender: sender
        message: message
      .onValue (data) ->
        window.postMessage data

    bus

  inboundStream = (channelName, receiver) ->
    Bacon.fromEventTarget(window, "message")
      .filter((event) ->
        (event.data.channel is channelName) and !deepEqual(event.data.sender, receiver)
      )
      .map((event) -> event.data.message)

  class PubSubChannel
    constructor: (@name) ->
      @identity = generateUUID()
      @outbound = outboundBus @name, @identity
      @inbound = inboundStream @name, @identity

    publish: (value) =>
      @outbound.push value
      @

    subscribe: (listener) =>
      @inbound.onValue listener.bind {
        reply: @publish
      }

  ###
   # @namespace supersonic.data
   # @name channel
   # @function
   # @apiCall supersonic.data.channel
   # @description
   # Access a publish-subscribe messaging channel for cross-view communication
   # @type
   # channel: (
   #   name: String
   # ) => PubSubChannel
   # @define {String} name A shared name for parties that want to communicate on this channel
   # @exampleCoffeeScript
   # # WebView one
   # supersonic.data.channel('events').publish('you would not believe what just happened')
   # # WebView two
   # supersonic.data.channel('events').subscribe (message) ->
   #   @reply 'well, what happened?'
   # @exampleJavaScript
   # // WebView one
   # supersonic.data.channel('events').publish('you would not believe what just happened');
   # // WebView two
   # supersonic.data.channel('events').subscribe( function(message) {
   #   this.reply('well, what happened?');
   # });
  ###
  return createChannel = (name) ->
    new PubSubChannel name
