$(document).ready(function() {
  var pageContent = $('#page_content').val();

  var $mainContent = $('#edit_page');
      $mainContent.append('<div id=\'html_editor\' class=\'html_editor\'></div>');

  var editor = ace.edit("html_editor");
      editor.setTheme("ace/theme/textmate");
      editor.getSession().setMode("ace/mode/html");
      editor.setValue(pageContent);

  $('#html_editor').closest('form').submit(function() {
      var editorContent = editor.getValue();

      $('#page_content').val(editorContent);
  });
});
