Promise = require 'bluebird'

module.exports = retryIndefinitelyWithInterval = (interval, f) ->
  Promise.try(f).catch ->
    Promise.delay(interval).then ->
      retryIndefinitelyWithInterval interval, f
