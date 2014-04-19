loadHtmlEditor = ->
  mainContent = $('#edit_page')
  mainContent = $('#new_page')  unless mainContent[0]
  return  unless mainContent[0]

  mainContent.append '<div id="html_editor" class="html_editor"></div>'

  pageContent = $('#page_content').val()

  editor = ace.edit('html_editor')
  editor.setTheme 'ace/theme/textmate'
  editor.getSession().setMode 'ace/mode/html'
  editor.setValue pageContent

  $('#html_editor').closest('form').submit ->
    editorContent = editor.getValue()

    $('#page_content').val editorContent
    return

  return

$(document).ready loadHtmlEditor
$(document).on 'page:load', loadHtmlEditor
