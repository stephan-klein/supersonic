module.exports = (angular) ->
  angular
    .module('supersonic.helpers', [])
    .service('qify', ($q) ->
      qify = (f) -> (args...) -> $q.when f args...
    )
    .service('qifyAll', (qify) ->
      qifyAll = (object) ->
        result = {}
        for key, value of object
          result[key] = switch true
            when value instanceof Function then qify value
            when value instanceof Object then qifyAll value
            else value
        result
    )