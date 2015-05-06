module.exports = (logger, window) ->
  if window.appgyver?
    window.appgyver.environment
  else if window.parent?.appgyver?
    window.parent.appgyver.environment
  else
    { mode: "legacy" }
