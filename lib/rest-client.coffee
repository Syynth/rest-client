RestClientView = require './rest-client-view'

module.exports =
  restClientView: null

  activate: (state) ->
    console.log 'Activating Rest Client!'
    @restClientView = new RestClientView(state.restClientViewState)
    atom.workspaceView.appendToRight(@restClientView)
    atom.workspaceView.command "rest-client:open", =>
      console.log 'Opening Rest Client...'
      atom.workspaceView.appendToRight(@restClientView)

  deactivate: ->
    @restClientView.destroy()

  serialize: ->
    restClientViewState: @restClientView.serialize()
