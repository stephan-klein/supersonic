
module.exports = (logger, window) ->
  model: require('./model')(logger, window)
  channel: require('./channel')(window)
