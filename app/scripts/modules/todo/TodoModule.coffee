BaseModule = require '../BaseModule'

module.exports = class TodoModule extends BaseModule
  initialize: ->
    @MainView = require './views/MainView'

    console.log 'Initializing TodoModule'
    @startWithParent = true

  onStart: ->
    super()
    console.log 'Starting TodoModule'

  onStop: ->
    super()
    console.log 'Stopping TodoModule'
