$('#main-content').html('<%= escape_javascript(render(:partial =>'post', :collection=>@post))%>')
  .hide()
  .fadeIn()
$('#search')[0].reset()
