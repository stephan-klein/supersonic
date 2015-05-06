describe "supersonic.auth", ->
  before ->

  it "should be defined", ->
    supersonic.should.have.property('auth')

  describe "users", ->
    it "should be defined", ->
      supersonic.auth.should.have.property('users')

    describe "findAll()", ->
      it "should return at least one user", ->
        supersonic.auth.users.findAll().then (users) ->
          users.length.should.be.greaterThan 0

    describe "getCurrentUser()", ->
      it "should return a user", ->
        supersonic.auth.users.getCurrentUser().then (user) ->
          user.should.have.property('username')

  describe "session", ->
    it "should be defined", ->
