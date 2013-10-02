Backbone = require('backbone')

module.exports = class DebugView extends Backbone.View

    constructor: (model) ->
        super({
            el: '#debugview'
            model: model
        })

        @visible = false
        @$rooms = @$el.find('[name=rooms]').click(-> Backbone.trigger('show:rooms'))
        @$newroom = @$el.find('[name=newroom]').click(-> Backbone.trigger('show:newroom'))
        @$home = @$el.find('[name=home]').click(-> Backbone.trigger('show:home'))
        @$users = @$el.find('[name=users]').click(-> Backbone.trigger('show:users'))
        @$add = @$el.find('[name=add]').click(-> Backbone.trigger('show:add'))
        @$edit = @$el.find('[name=edit]').click(-> Backbone.trigger('show:edit'))
        @$delete = @$el.find('[name=delete]').click(-> Backbone.trigger('show:delete'))

        window.focus()
        $(window).keyup(@keyUpHandler)

    keyUpHandler: (event) =>
        if event.altKey
            log("DebugView.keyUpHandler", event)
            switch event.keyCode
                when 'S'.charCodeAt(0)    
                    @$el.toggle(0)