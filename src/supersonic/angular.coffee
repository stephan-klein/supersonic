module.exports = (angular, supersonic) ->
  angular
    .module('supersonic', [])
    .service('supersonic', ($q) ->
      qify = (f) -> (args...) -> $q.when f args...
      qifyAll = (object) ->
        result = {}
        for key, value of object
          result[key] = if value instanceof Function
              qify value
            else
              value
        result

      qifyAll supersonic
    )