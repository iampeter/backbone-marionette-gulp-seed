BaseModule = require '../BaseModule'

module.exports = class NotificationModule extends BaseModule
  initialize: ->
    @MainView = require './views/MainView'

    console.log 'Initializing NotificationModule'
    @startWithParent = false

  onStart: ->
    super()
    console.log 'Starting NotificationModule'

  onStop: ->
    console.log 'Stopping NotificationModule'
