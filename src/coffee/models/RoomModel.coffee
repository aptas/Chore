Backbone = require('backbone')

module.exports = class RoomModel extends Backbone.Model
  constructor: (attrs = {}, options = {}) ->
    attrs.name ?= undefined
    attrs.index ?= undefined
    super(attrs, options)