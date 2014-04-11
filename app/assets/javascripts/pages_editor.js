$(document).ready(function() {
  var editor = ace.edit("html-editor");
      editor.setTheme("ace/theme/textmate");
      editor.getSession().setMode("ace/mode/html");
  $('#html-editor').closest('form').submit(function() {
      var code = editor.getValue();
      $('#page_content').val(code);
  });
});
