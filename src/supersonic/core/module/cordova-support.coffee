isFunction = require 'lodash/lang/isFunction'
set = require 'lodash/object/set'
has = require 'lodash/object/has'
get = require 'lodash/object/get'
merge = require 'lodash/object/merge'
compose = require 'lodash/function/compose'

module.exports = (superglobal, global) ->
  isInIframe = ->
    global.frameElement?

  init = switch
    when isInIframe()
      ->
        mapGlobalSteroids()

        cordova = mapGlobalCordova()
        mapPlugins cordova

        mapEvents()
    else
      noop = ->

  channelDownEvent = (type) ->
    superglobal.document.addEventListener type, ->
      event = global.document.createEvent 'Events'
      event.initEvent type, false, false
      global.document.dispatchEvent event

  mapPlugins = (cordova) ->
    return unless cordova?
    plugins = cordova.require "cordova/plugin_list"

    cleanPropertyPath = (fn) -> (path) ->
      if path?.indexOf("window.") == 0
        fn path.substring 7
      else
        fn path

    addPlugin = (pluginInstance, path) ->
      if isFunction pluginInstance
        set global, path, pluginInstance
      else
        if has global, path
          toMerge = get global, path
          merge toMerge, pluginInstance
        else
          set global, path, pluginInstance

    mapClobber = (plugin) ->
      if plugin.clobbers?.length > 0
        plugin.clobbers.forEach cleanPropertyPath (path) ->
          pluginInstance = cordova.require plugin.id
          addPlugin pluginInstance, path
      plugin

    mapMerge = (plugin) ->
      if plugin.merges?.length > 0
        plugin.merges.forEach cleanPropertyPath (path) ->
          pluginInstance = cordova.require plugin.id
          if path? && path == "window"
            merge global, pluginInstance
          else if path != ""
            addPlugin pluginInstance, path
      plugin

    mapPlugin = compose mapClobber, mapMerge

    for plugin in plugins || []
      mapPlugin plugin

  mapGlobalCordova = ->
    return unless superglobal?.cordova?
    global.cordova = superglobal.cordova
    global.cordova

  mapGlobalSteroids = ->
    return unless superglobal?.steroids?.version
    global.steroids = superglobal.steroids

  mapEvents = -> ['deviceready'].forEach channelDownEvent

  return {
    init
  }

