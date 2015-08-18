module.exports = (logger, superglobal) ->
  superglobal.appgyver?.environment || { mode: "legacy" }
