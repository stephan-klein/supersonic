module.exports = pick = (keys, object) ->
  result = {}
  for key, value of object when (key in keys)
    result[key] = value
  result
