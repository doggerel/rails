$("#main-content").html('<%=escape_javascript(render(:partial => "user_posts_all", :collection=>@posts))%>')
  .hide()
  .fadeIn('veryslow')
