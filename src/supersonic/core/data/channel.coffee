Bacon = require 'baconjs'
deepEqual = require 'deep-equal'

module.exports = (window) ->

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

  nextId = do ->
    id = 0
    ->
      ++id

  class PubSubChannel
    constructor: (@name) ->
      @identity =
        instance: nextId()
        view: window.AG_WEBVIEW_UDID
      @outbound = outboundBus @name, @identity
      @inbound = inboundStream @name, @identity

    publish: (value) =>
      @outbound.push value
      @

    subscribe: (listener) =>
      @inbound.onValue listener.bind {
        reply: @publish
      }

  return createChannel = (name) ->
    new PubSubChannel name
