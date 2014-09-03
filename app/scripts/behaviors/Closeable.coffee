module.exports = class Closeable extends Marionette.Behavior

  ui:
    close: 'button.close'

  events:
    'click @ui.close': 'closeClicked'

  closeClicked: ->
    @view.trigger 'region:off'
