$("#main-content").append('<%= escape_javascript(render(:partial => @post))%>')
  .hide()
  .fadeIn()
$('#search')[0].reset()



