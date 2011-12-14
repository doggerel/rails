$("#main-content").append('<%=escape_javascript(render(:partial=>user_posts_all, :collection=>@posts))%>')
  .hide()
  .fadeIn('veryslow')
