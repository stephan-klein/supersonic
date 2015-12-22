module.exports = without = (keys, object) ->
  result = {}
  for key, value of object when not (key in keys)
    result[key] = value
  result
