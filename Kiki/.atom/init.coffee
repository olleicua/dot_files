# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.workspace.observeTextEditors (editor) ->
  editor.currentLine = ->
    currentPosition = @getCursorBufferPosition()
    beginningOfLine = [currentPosition.row, 0]
    beginningOfNextLine = [currentPosition.row + 1, 0]
    [beginningOfLine, beginningOfNextLine]

atom.commands.add 'atom-text-editor', 'custom:toggle-checkbox', ->
  editor = atom.workspace.getActiveTextEditor()
  editor.scanInBufferRange(
    /^- \[(.)\]/,
    editor.currentLine(),
    ({match, replace}) ->
      replace(if match[1] is ' ' then '- [x]' else '- [ ]')
  )
