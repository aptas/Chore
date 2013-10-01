Backbone = require('backbone')
View = require('views/View')

module.exports = class AddView extends View

  constructor: (model) ->
    super({
      el: '#addview'
      model: model
    })

    @$button = @$el.find('button')
    @$button.on('click', @onButtonClick)

    @$form = @$el.find('form')
    @$nameField = @$el.find('[name=name]')
    @$emailField = @$el.find('[name=email]')

  onButtonClick: () =>
    if @$form.parsley('validate')
      Backbone.trigger('do:add', @$nameField[0].value, @$emailField[0].value)