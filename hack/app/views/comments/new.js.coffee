$("#main-content").append('<%= escape_javascript(render(:partial => "comment_form",
  :locals=>{:post => @post}))%>')
  .hide()
  .fadeIn()
$('#search')[0].reset()

