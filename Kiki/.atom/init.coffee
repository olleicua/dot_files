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

deleteHorizontalSpace = (replacement) ->
  editor = atom.workspace.getActiveTextEditor()
  cursors = editor.getCursors()
  editor.scan /\s+/g, ({range, replace}) ->
    if cursors.some((c) -> range.containsPoint(c.getBufferPosition()))
      replace replacement

atom.commands.add 'atom-text-editor', 'custom:delete-horizontal-space', ->
  deleteHorizontalSpace ''

atom.commands.add 'atom-text-editor', 'custom:shorten-horizontal-space', ->
  deleteHorizontalSpace ' '

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
