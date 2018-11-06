var count = 0;

$('.validated-form').on('submit', function(e) {
	
	var flag = false;
	var str = '';
	$(this).parent().find('.form-control').each(function(index) {

		if(!$(this).hasClass('pure'))
			if($(this).val() === null || $(this).val() === '') {
				flag = true;
				str += 'Field: ' + $(this).attr('name') + '\n';
			}
	});

	if(flag) {
		e.preventDefault();
		alert(str + 'Must be required!');
		return false;
	} else {

		if($('.password').val() !== $('.repeat-password').val()) {
			e.preventDefault();
			alert('Passwords are not equal!');
			return false;
		}
	}

	/**
	*	To avoid multisubmits
	*/
	count++;
	if(count > 1) {
		e.preventDefault();
		return false;
	}
});