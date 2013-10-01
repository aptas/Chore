Backbone = require('backbone')

module.exports = class UserModel extends Backbone.Model
  constructor: (attrs = {}, options = {}) ->
    attrs.name ?= undefined
    attrs.email ?= undefined
    super(attrs, options)