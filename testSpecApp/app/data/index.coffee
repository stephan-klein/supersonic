expect = window.chai.expect
window.chai.should()

# Evaluates a function. Returns null if the function is successful, or an Error otherwise.
# Usage:
#   it "lols", (done) ->
#     done asserting ->
#       "lol".should.equal "lol"
#
asserting = (f) ->
  try
    f()
    null
  catch e
    e
