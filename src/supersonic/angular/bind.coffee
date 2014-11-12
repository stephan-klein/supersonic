deepEqual = require 'deep-equal'

bindFactory = (superscope)->
  (scope, property)->
    scope.$watch property, (newValue, oldValue)->
      # see https://docs.angularjs.org/api/ng/type/$rootScope.Scope
      #
      # After a watcher is registered with the scope, the listener fn is called
      # asynchronously (via $evalAsync) to initialize the watcher.
      # In rare cases, this is undesirable because the listener is called when
      # the result of watchExpression didn't change. To detect this scenario
      # within the listener fn, you can compare the newVal and oldVal.
      # If these two values are identical (===) then the listener was called due
      # to initialization."
      return if deepEqual(newValue,oldValue)

      fn = ->
        superscope[property] = newValue

      if superscope.$root.$$phase == "$apply" || superscope.$root.$$phase == "$digest"
        fn()
      else
        superscope.$apply fn

    superscope.$watch property, (newValue, oldValue)->
      fn = ->
        scope[property] = newValue

      if scope.$root.$$phase == "$apply" || scope.$root.$$phase == "$digest"
        fn()
      else
        scope.$apply fn


module.exports = (angular) ->
  angular
  .module 'supersonic.bind', ['supersonic.superscope']
  .service 'supersonicBind', bindFactory
