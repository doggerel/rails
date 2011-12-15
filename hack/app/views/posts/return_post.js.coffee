$("#full-post").html('<%= escape_javascript(render(:partial => "full_post",:collection=>@post))%>')
  .hide()
  .fadeIn()
