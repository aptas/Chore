Backbone = require('backbone')
View = require('views/View')

module.exports = class IntroView extends View

    constructor: (model) ->
        super({
            el: '#introview'
            model: model
        })

        @$button = @$el.find('button')
        @$button.on('click', => 
            Backbone.trigger('show:users')
        )
        
    show: =>
        super()