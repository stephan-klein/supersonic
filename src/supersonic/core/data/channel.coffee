module.exports = (window) ->
  class PubSubChannel
    constructor: (@name) ->

    publish: ->
    subscribe: ->

  return createChannel = (name) ->
    new PubSubChannel name