
UserModel = require('./UserModel')

module.exports = class RoomCollection extends Backbone.Firebase.Collection
	
	constructor: (attrs = [], options = {}) ->
		options.model = RoomModel
		@firebase = options.firebase + "/rooms"
		super(attrs, options)
