Todo = require('../models/Todo')
Todos = require('../collections/Todos')

module.exports = class MainView extends Backbone.Marionette.CompositeView
  template: require './templates/main'
  itemViewContainer: "#todo-list"
  itemView: require('./TodoView')

  ui:
    form: 'form#new-todo'
    close: 'button.close'

  triggers:
    'click @ui.close': 'stop:notification:module'

  events:
    "submit @ui.form": "addTodo"

  initialize: (options) ->
    @vent = options.vent

  itemViewOptions: ->
    vent: @vent

  addTodo: (e) ->
    e.preventDefault()

    data = Backbone.Syphon.serialize(@)
    @collection.add(new Todo({ text: data.todo }))

    @render()
    @vent.trigger 'new:notification', "Added todo: " + data.todo
