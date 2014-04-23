{View} = require 'atom'
HeadersView = require './headers-view'

module.exports =
class RestClientView extends View
  @content: ->
    @div class: 'rest-client tool-panel panel-right', =>
      @h2 {style: 'display: inline-block;'}, 'Rest Client v0.0.0'
      @button {outlet: 'close', class: 'right'}, 'X'
      @hr()
      @section =>
        @div =>
          @span 'HTTP Method:'
          @select {class: 'right'}, =>
            @option 'Post'
            @option 'Get'
            @option 'Put'
            @option 'Delete'
            @option 'Patch'
            @option 'Options'
        @hr()
        @div =>
          @span 'Host/Port:'
          @input {type: 'text', class: 'right'}
        @hr()
        @div =>
          @span 'Path:'
          @input {type: 'text', class: 'right'}
        @hr()
        @div =>
          @h4 'Headers'
          @subview 'headers', new HeadersView()
        @hr()
        @div =>
          @h4 'Params'
          @textarea()
        @hr()
        @div =>
          @button {click: 'sendRequest', class: 'right'}, 'Send'


  initialize: (serializeState) ->
    atom.workspaceView.command 'rest-client:close', => @detach()
    @close.on 'click', => @detach()


  sendRequest: ->

  # Returns an object that can be retrieved when package is activated
  serialize: ->
    @hasParent()

  # Tear down any state and detach
  destroy: ->
    @detach()
