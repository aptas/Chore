Backbone = require('backbone')
View = require('views/View')

module.exports = class EditView extends View

  constructor: (model) ->
    super({
      el: '#editview'
      model: model
    })

    @$button = @$el.find('button')
    @$button.on('click', @onButtonClick)

    @$form = @$el.find('form')
    @$nameField = @$el.find('[name=name]')
    @$emailField = @$el.find('[name=email]')

    @model.on('change:editing', @onEditingChange)

  onEditingChange: (model, id) =>
    user = @model.get('users').get(@model.get('editing'))
    if user
      @$nameField.val(user.get('name'))
      @$emailField.val(user.get('email'))

  onButtonClick: () =>
    user = @model.get('users').get(@model.get('editing'))
    if @$form.parsley('validate')
      Backbone.trigger('do:edit', user.get('id'), @$nameField[0].value, @$emailField[0].value)