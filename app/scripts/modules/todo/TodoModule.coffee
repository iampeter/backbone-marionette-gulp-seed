Todos = require './collections/Todos'
BaseModule = require '../BaseModule'

module.exports = class TodoModule extends BaseModule
  initialize: ->
    @MainView = require './views/MainView'

    console.log 'Initializing TodoModule'
    @startWithParent = true

    @collection = new Todos([
      { text: "Wash dishes", done: false }
      { text: "Learn Marionette.js", done: true }
    ])

    @app.router.processAppRoutes @, {
      'todo/:text': 'showTodo'
    }

  onStart: ->
    super()
    console.log 'Starting TodoModule'

  onStop: ->
    console.log 'Stopping TodoModule'

  showTodo: (text) ->
    @collection.showTodo(text)
