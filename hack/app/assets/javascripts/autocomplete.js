$(function() {
  $('#search').autocomplete({
    source: '/autocomplete/title'
  });
})
 $(document).ready(function() {
   $('#loading').hide();
    $('#loading').ajaxStart(function() {
        $(this).delay(1500);
        $(this).show();
        $('#main-content').hide();
        }).ajaxStop(function() {
        $(this).hide();
        $('#main-content').fadeIn('veryslow');
    }); 
});
$(document).ready(function(){  
  $('form[data-remote]').bind("ajax:before", function(){
    for (instance in CKEDITOR.instances){
      CKEDITOR.instances[instance].updateElement();
    }
  });
});
