$('<%= escape_javascript(render(:partial => @post))%>')
  .append('#main')
  .hide()
  .fadeIn()
$('#search')[0].reset()



