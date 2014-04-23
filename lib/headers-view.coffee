{View, $$} = require 'atom'

module.exports =
class HeadersView extends View

  @content: ->
    @div {class: 'headers-view'}, =>
      @div {class: 'headers'}, =>
        @ul {outlet: 'list'}
      @button {click: 'addHeader'}, '+'
      @button {click: 'removeHeader'}, '-'


  addHeader: ->
    l = @list.find('li').length
    @list.append $$ ->
      @li =>
        @text "Header Param #{++l}"

  removeHeader: ->
    @list.find('li').last()?.detach()

  initialize: (serializeState) ->

  serialize: ->
