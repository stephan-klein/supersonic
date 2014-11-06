module.exports = (window) ->

  outboundBus = (name) ->
    bus = new Bacon.Bus

    bus
      .map (message) ->
        channel: name
        message: message
      .onValue (data) ->
        window.postMessage data

    bus

  inboundStream = (name) ->
    Bacon.fromEventTarget(window, "message")
      .filter((event) -> event.data.channel is name)
      .map((event) -> event.data.message)

  class PubSubChannel
    constructor: (@name) ->
      @outbound = outboundBus @name
      @inbound = inboundStream @name

    publish: (value) =>
      @outbound.push value
      @

    subscribe: (listener) =>
      @inbound.onValue listener.bind {
        reply: @publish
      }

  return createChannel = (name) ->
    new PubSubChannel name
