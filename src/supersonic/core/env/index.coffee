module.exports = (logger, window) ->
  window.parent.appgyver?.environment || { mode: "legacy" }
