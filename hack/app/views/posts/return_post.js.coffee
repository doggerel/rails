$("#full-post").html('<%= escape_javascript(render(:partial=>"full_post")) %>')
  .hide()
 .fadeIn('veryslow')

