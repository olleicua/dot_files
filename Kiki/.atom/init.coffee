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
    editor.scanInBufferRange /^- \[(.)\]/,
      cursor.getCurrentLineBufferRange(),
      ({match, replace}) ->
        replace if match[1] is ' ' then '- [x]' else '- [ ]'

# REMOVE HORIZONTAL SPACE #

deleteHorizontalSpace = ->
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  editor.scan /\s+/g, ({range, replace}) ->
    if cursors.some((c) -> range.containsPoint c.getBufferPosition())
      replace ''
atom.commands.add 'atom-text-editor', 'custom:delete-horizontal-space', ->
  deleteHorizontalSpace()
atom.commands.add 'atom-text-editor', 'custom:shorten-horizontal-space', ->
  deleteHorizontalSpace()
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  for cursor in cursors
    p = cursor.getBufferPosition()
    editor.setTextInBufferRange [p, p], ' '

# SWITCH TO MOST RECENT TAB #

activeTabHistory = []
addToActiveTabHistory = ([pane, tab]) ->
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

 uniq = (array) ->
  result = []
  for value in array
    if value not in result
      result.push value
  return result

currentRows = ->
  rows = []
  editor = atom.workspace.getActiveTextEditor()
  for cursor in editor.getCursors()
    rows.push cursor.getCurrentLineBufferRange().start.row
  for selection in editor.getSelectedBufferRanges()
    rows = rows.concat [selection.start.row .. selection.end.row]
  uniq rows

fixCursorPlacement = ->
  editor = atom.workspace.getActiveTextEditor()
  for cursor in editor.getCursors()
    endOfIndentation = null
    editor.scanInBufferRange /^\s*/,
      cursor.getCurrentLineBufferRange(),
      ({range}) -> endOfIndentation = range.end
    if endOfIndentation.column > cursor.getBufferPosition().column
      cursor.setBufferPosition endOfIndentation

indent = ->
  editor = atom.workspace.getActiveTextEditor()
  editor.transact ->
    for row in currentRows()
      editor.setTextInBufferRange [[row, 0], [row, 0]], '  '
  fixCursorPlacement()

unindent = ->
  editor = atom.workspace.getActiveTextEditor()
  editor.transact ->
    for row in currentRows()
      line = [[row, 0], [row, 2]]
      editor.scanInBufferRange /^  /, line, ({replace}) -> replace ''
  fixCursorPlacement()

customAutocomplete = ->
  editor = atom.workspace.getActiveTextEditor()
  view = atom.views.getView editor
  if document.querySelector('atom-overlay.autocomplete-plus')
    atom.commands.dispatch view, 'autocomplete-plus:confirm'
  else
    atom.commands.dispatch view, 'autocomplete-plus:activate'

atom.commands.add 'body', 'custom:tab', ->
  editor = atom.workspace.getActiveTextEditor()
  cursor = editor.getCursors()[0]
  p = cursor.getBufferPosition()
  if p.column is 0
    indent()
    return
  str = editor.getTextInBufferRange [p.translate([0, -1]), p.translate([0, 1])]
  if /^[a-zA-Z0-9][^a-zA-Z0-9]?$/.exec str
    customAutocomplete()
  else
    indent()

atom.commands.add 'body', 'custom:shift-tab', ->
  unindent()
  # editor = atom.workspace.getActiveTextEditor()
  # view = atom.views.getView editor
  # if document.querySelector 'atom-overlay.autocomplete-plus'
  #   atom.commands.dispatch view, 'core:move-up'
  # else
  #   unindent()

# CURSOR IMPROVEMENTS #

# updateCursorCss = (cursor) ->
#   window.CCC = cursor
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.observeCursors (cursor) ->
#     updateCursorCss(cursor)
#     cursor.onDidChangePosition ->
#       updateCursorCss cursor

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
