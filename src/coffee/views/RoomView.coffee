Backbone = require('backbone')
View = require('views/View')

module.exports = class RoomView extends Backbone.View

  constructor: (model) ->
    super({
      model: model
      tagname: 'option'
    })

    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'remove', @remove)

  render: () =>
    @$el.attr('value', @model.get('id'))
    @$el.html(@model.get('name'))
    return @