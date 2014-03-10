EmptyRegionView = require '../views/EmptyRegionView'

module.exports = class ToggleableRegion extends Backbone.Marionette.Region
  initialize: (options) ->
    @module = options.module
    @module.region = @
    @initShow()

  initShow: ->
    @emptyView = new EmptyRegionView()
    @show(@emptyView)
    @listenTo @emptyView, 'region:on', @activateModule

  activateModule: ->
    @module.start()

  onClose: (view) ->
    @initShow() unless view instanceof EmptyRegionView 
