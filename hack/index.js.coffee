$('<%= escape_javascript(render(:partial =>@posts))%>')
  .append('#main')
  .hide()
  .fadeIn()
$('#search')[0].reset()