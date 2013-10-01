Backbone = require('backbone')
View = require('views/View')

module.exports = class UserView extends Backbone.View

  constructor: (model) ->
    @template = _.template($('#user-template').html())
    super({
      model: model
      tagname: 'li'
    })

    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'remove', @remove)

  render: () =>
    @$el.html(@template(@model.toJSON()))
    @$edit = @$el.find('[name=edit]')
    @$edit.on('click', @onEdit) 
    @$delete = @$el.find('[name=delete]')
    @$delete.on('click', @onDelete) 
    return @

  onEdit: (evt) =>
    Backbone.trigger('show:edit',  @model.get('id'))

  onDelete: (evt) =>
    Backbone.trigger('show:delete', @model.get('id'))