module.exports = class TodoView extends Backbone.Marionette.ItemView
  template: require './templates/todo'
  className: ->
    'list-group-item' + if @model.get('active') then ' active' else ''

  ui:
    check: '.check'
    close: '.close'

  events:
    'click @ui.check': 'toggleCheck'
    'click @ui.close': 'removeTodo'

  modelEvents:
    'change:done': 'render'
    'change:active': 'todoToggled'

  todoToggled: ->
    @$el.toggleClass('active')
    App.vent.trigger 'new:notification', "Selected/unselected todo: " + @model.get('text')

  toggleCheck: ->
    @model.set('done', !@model.get('done'))
    App.vent.trigger 'new:notification', "Toggled todo: " + @model.get('text')

  removeTodo: ->
    @model.destroy()
    App.vent.trigger 'new:notification', "Removed todo: " + @model.get('text')

