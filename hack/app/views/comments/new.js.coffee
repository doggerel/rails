$("#main-content").html('<%=escape_javascript(render(:partial => "comment_form"))%>')
  .hide()
  .slideIn()

