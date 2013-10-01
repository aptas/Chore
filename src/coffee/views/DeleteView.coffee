Backbone = require('backbone')
View = require('views/View')

module.exports = class DeleteView extends View

  constructor: (model) ->
    super({
      el: '#deleteview'
      model: model
    })

    @$button = @$el.find('button')
    @$button.on('click', @onButtonClick)

    @$nameField = @$el.find('[name=name]')
    @$emailField = @$el.find('[name=email]')

    @model.on('change:editing', @onEditingChange)

  onEditingChange: (model, id) =>
    log("delete;", model, id)

    user = @model.get('users').get(id)
    if user
      @$nameField.text(user.get('name'))
      @$emailField.text(user.get('email'))

  onButtonClick: () =>
    log("clicky")
    Backbone.trigger('do:delete')