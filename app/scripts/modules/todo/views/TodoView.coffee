module.exports = class TodoView extends Backbone.Marionette.ItemView
  template: require './templates/todo'
  className: 'list-group-item'

  ui:
    check: '.check'
    close: '.close'
    text: '.text'

  events:
    'click @ui.check': 'toggleCheck'
    'click @ui.text': 'toggleCheck'
    'click @ui.close': 'removeTodo'

  initialize: (options) ->
    @vent = options.vent

  modelEvents:
    'change:done': 'render'

  toggleCheck: ->
    @model.set('done', !@model.get('done'))
    @vent.trigger 'new:notification', "Toggled todo: " + @model.get('text')

  removeTodo: ->
    @model.destroy()
    @vent.trigger 'new:notification', "Removed todo: " + @model.get('text')

