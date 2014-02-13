Todo = require('../models/Todo')
Todos = require('../collections/Todos')

module.exports = class AppView extends Backbone.Marionette.CompositeView
  template: require './templates/app'
  el: "#app"
  itemViewContainer: "#todo-list"
  itemView: require('./TodoView')

  ui:
    form: 'form#new-todo'

  events:
    "submit @ui.form": "addTodo"

  initialize: (options) ->
    @collection = new Todos([
      { text: "Wash dishes", done: false }
      { text: "Learn Marionette.js", done: true }
    ])

  addTodo: (e) ->
    e.preventDefault()

    data = Backbone.Syphon.serialize(@)
    @collection.add(new Todo({ text: data.todo }))

    @render()
