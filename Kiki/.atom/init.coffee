# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.

# CHECK BOXES #

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

# REMOVE HORIZONTAL SPACE #

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

# SWITCH TO MOST RECENT TAB #

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

# TAB (indentation / autocomplete) #

indent = ->
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  for cursor in cursors
    beginningOfLine = cursor.getCurrentLineBufferRange().start
    editor.setTextInBufferRange([beginningOfLine, beginningOfLine], '  ')

unindent = ->
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  for cursor in cursors
    line = cursor.getCurrentLineBufferRange()
    editor.scanInBufferRange(/^  /, line, ({replace}) -> replace(''))

customAutocomplete = ->
  editor = atom.workspace.getActiveTextEditor()
  view = atom.views.getView(editor)
  if document.querySelector('atom-overlay.autocomplete-plus')
    atom.commands.dispatch(view, 'core:move-down')
  else
    atom.commands.dispatch(view, 'autocomplete-plus:activate')

atom.commands.add 'body', 'custom:tab', ->
  editor = atom.workspace.getActiveTextEditor()
  cursor = editor.getCursors()[0]
  p = cursor.getBufferPosition()
  if p.column is 0
    indent()
    return
  str = editor.getTextInBufferRange([p.translate([0, -1]), p.translate([0, 1])])
  if /^[a-zA-Z0-9][^a-zA-Z0-9]?$/.exec(str)
    customAutocomplete()
  else
    indent()

atom.commands.add 'body', 'custom:shift-tab', ->
  editor = atom.workspace.getActiveTextEditor()
  view = atom.views.getView(editor)
  if document.querySelector('atom-overlay.autocomplete-plus')
    atom.commands.dispatch(view, 'core:move-up')
  else
    unindent()

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
