Todo = require('../models/Todo')
Todos = require('../collections/Todos')

module.exports = class MainView extends Backbone.Marionette.CompositeView
  template: require './templates/main'
  childViewContainer: "#todo-list"
  childView: require('./TodoView')

  behaviors:
    Closeable: {}

  ui:
    form: 'form#new-todo'
    input: 'form#new-todo input'

  events:
    "submit @ui.form": "addTodo"

  addTodo: (e) ->
    e.preventDefault()

    data = Backbone.Syphon.serialize(@)
    @collection.add(new Todo({ text: data.todo }))

    @render()
    App.vent.trigger 'new:notification', "Added todo: " + data.todo

  onRender: ->
    @ui.input.focus()
