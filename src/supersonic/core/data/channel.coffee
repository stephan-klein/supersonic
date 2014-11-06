module.exports = (window) ->
  class PubSubChannel
    constructor: (@name) ->

    publish: (value) =>
      @outbound.push value

    subscribe: (listener) =>
      @inbound.onValue listener.bind {
        reply: @publish
      }

  return createChannel = (name) ->
    new PubSubChannel name