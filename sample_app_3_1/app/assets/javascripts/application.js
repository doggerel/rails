$(document).ready(function(){
$('#content').NobleCount('#count',{
	on_negative: 'go_red',
	on_positive: 'go_green',
	max_chars: 25,
	on_update: function(t_obj, char_area, c_settings, char_rem){
		if ((char_rem % 10) == 0) {
			char_area.css('font-weight', 'bold');
			char_area.css('font-size', '300%');
		} else {
			char_area.css('font-weight', 'normal');
			char_area.css('font-size', '100%');
		}
	}
});
  
})
