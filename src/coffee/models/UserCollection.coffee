
UserModel = require('./UserModel')

module.exports = class UserCollection extends Backbone.Firebase.Collection
	
	constructor: (attrs = [], options = {}) ->
		options.model = UserModel
		@firebase = options.firebase + "/users"
		log(@firebase)
		super(attrs, options)
