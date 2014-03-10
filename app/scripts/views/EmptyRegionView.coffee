module.exports = class EmptyRegionView extends Marionette.ItemView
  template: require './templates/emptyregion'

  ui:
    regionOn: '.region-on'

  triggers:
    "click @ui.regionOn": 'region:on'
