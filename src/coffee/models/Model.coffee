
UserCollection = require('./UserCollection')

module.exports = class Model extends Backbone.Model
  constructor: (attrs = {}, options = {}) ->
    attrs.users = new UserCollection()
    attrs.active = undefined
    attrs.editing = undefined
    super(attrs, options)