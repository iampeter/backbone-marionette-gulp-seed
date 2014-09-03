EmptyRegionView = require '../views/EmptyRegionView'

module.exports = class ToggleableRegion extends Backbone.Marionette.Region
  initialize: (options) ->
    @module = options.module
    @module.region = @

    @initShow()

  initShow: ->
    @emptyView = new EmptyRegionView()
    @show(@emptyView)

  onShow: (view) ->
    @listenTo view, 'region:on', =>
      @module.start()

    @listenTo view, 'region:off', =>
      @module.stop()
      @initShow()