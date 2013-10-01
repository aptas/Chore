
UserModel = require('./UserModel')

module.exports = class UserCollection extends Backbone.Firebase.Collection
	
	constructor: (params = [], options = {}) ->
		options.model = UserModel
		@firebase = "http://chore.firebaseio.com/users"
		super(params, options)
