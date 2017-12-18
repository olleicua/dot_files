# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.

atom.commands.add 'atom-text-editor', 'custom:toggle-checkbox', ->
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  for cursor in cursors
    editor.scanInBufferRange(
      /^- \[(.)\]/,
      cursor.getCurrentLineBufferRange(),
      ({match, replace}) ->
        replace(if match[1] is ' ' then '- [x]' else '- [ ]')
    )

deleteHorizontalSpace = ->
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  editor.scan /\s+/g, ({range, replace}) ->
    if cursors.some((c) -> range.containsPoint(c.getBufferPosition()))
      replace ''
atom.commands.add 'atom-text-editor', 'custom:delete-horizontal-space', ->
  deleteHorizontalSpace()
atom.commands.add 'atom-text-editor', 'custom:shorten-horizontal-space', ->
  deleteHorizontalSpace()
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  for cursor in cursors
    p = cursor.getBufferPosition()
    editor.setTextInBufferRange([p, p], ' ')

activeTabHistory = []
addToActiveTabHistory = ([pane, tab]) ->
  console.log pane, tab
  if activeTabHistory.length is 0
    activeTabHistory.push [pane, tab]
  else
    [lastPane, lastTab] = activeTabHistory[activeTabHistory.length - 1]
    activeTabHistory.push [pane, tab] unless pane is lastPane and tab is lastTab
atom.workspace.observePanes (pane) ->
  pane.onDidActivate ->
    addToActiveTabHistory [pane, pane.getActiveItem()]
  pane.onDidChangeActiveItem (item) ->
    addToActiveTabHistory [pane, item]
atom.commands.add 'atom-text-editor', 'custom:last-active-tab', ->
  if activeTabHistory.length > 1
    [pane, tab] = activeTabHistory[activeTabHistory.length - 2]
    pane.activateItem(tab)
    pane.activate()

# this is a bit hacky but isn't that the point :p
atom.commands.add 'body', 'custom:autocomplete', ->
  editor = atom.workspace.getActiveTextEditor()
  view = atom.views.getView(editor)
  if document.querySelector('atom-overlay.autocomplete-plus')
    atom.commands.dispatch(view, 'core:move-down')
  else
    atom.commands.dispatch(view, 'autocomplete-plus:activate')

# atom.commands.add 'atom-text-editor', 'custom:rectangle', ->
#   editor = atom.workspace.getActiveTextEditor()
#   range = editor.getSelectedBufferRange()
#   for selection in editor.getSelections()
#     console.log(selection);
#     selection.destroy()
#
#   left = Math.min(range.start.column, range.end.column)
#   width = Math.abs(range.start.column - range.end.column)
#   top = Math.min(range.start.row, range.end.row)
#   height = Math.abs(range.start.row - range.end.row)
#
#   for row in [0..height]
#     editor.addCursorAtBufferPosition([top + row, left])
