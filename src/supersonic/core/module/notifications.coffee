module.exports = (data) ->

  announcer: (namespace, options = {}) ->
    if !namespace
      throw new Error "Module namespace is required"

    events = options.events ? []

    if !events.length
      throw new Error "A list of event names is required"
