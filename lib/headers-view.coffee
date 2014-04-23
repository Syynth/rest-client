{View} = require 'atom'

module.exports =
class HeadersView extends View

  @content: ->
    @div {class: 'headers-view'}, =>
      @div {class: 'headers'}, =>
        @div()
      @button {click: 'addHeader'}, '+'
      @button {click: 'removeHeader'}, '-'


  addHeader: ->

  removeHeader: ->

  initialize: (serializeState) ->

  serialize: ->
