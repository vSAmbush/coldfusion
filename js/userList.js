function toggleObjects(object) {

	object.parent().parent().find('td').each(function(index) {

		if($(this).css('display') !== 'none') {
			$(this).hide();
		} else
			$(this).show();

	});
}

$('.editUser').on('click', function() {

	toggleObjects($(this));
});

$('.cancel').on('click', function() {

	toggleObjects($(this));
});