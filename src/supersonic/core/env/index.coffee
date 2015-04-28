module.exports = (logger, window) ->
  window.parent.appgyver?.env || { mode: "legacy" }
