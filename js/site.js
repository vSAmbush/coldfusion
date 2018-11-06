$('.edit').on('click', function(e) {

	var tr = $(this).parent().parent();

	//console.log(tr.next()[0]);

	var history = tr.next();

	if(history.css('display') === 'none') {
		history.show();

		$(this).html('Hide');
	} else {
		history.hide();
		$(this).html('Edit');
	}
});

$('.saveHistory').on('submit', function(e) {

	//Form DOES NOT conatains the elemnts. Don't know why
	//console.log($(this).find('select')[0]);
	//console.log($(this).find('input[type=text]')[0]);
	if($(this).parent().find('select').val() === null || $(this).parent().find('input[type=text]').val() === '') {

		e.preventDefault();
		alert('Enter comment and choose the state');
		return false;
	}

	//Затуп
	/*var id_state = $(this).parent().find('select')[0].selectedIndex;
	//console.log(id_state);
	$(this).parent().find('input[type=hidden]').val(id_state);*/
});

$(document).ready(function() {

	$('.states').find('option').each(function(index) {

		if($(this).html() === 'New') {
			$(this).attr('disabled', 'disabled');
		}
	});

	$('.state').each(function(index) {

		var bg_class = '';
		switch($(this).html()) {

			case 'New':
				bg_class = '';
				break;
			case 'Opened':
				bg_class = 'opened';
				break;
			case 'Decided':
				bg_class = 'decided';
				break;
			case 'Closed':
				var btn = $(this).parent().next().find('.btn'); 
				btn.parent().parent().hide();
				bg_class = 'closed';
				break;
		}
		$(this).parent().addClass(bg_class);
	});

	$('.act').each(function(index) {

		var bg_class = '';
		switch($(this).html()) {

			case 'Input':
				bg_class = '';
				break;
			case 'Opening':
				bg_class = 'opened';
				break;
			case 'Solution':
				bg_class = 'decided';
				break;
			case 'Closure':
				bg_class = 'closed';
				break;
		}
		$(this).parent().addClass(bg_class);
	});
});

var menu = [];
var isHide = false;
var width = $('.menu_container').width();
$('#menu_btn').on('click', function() {

	$(this).parent().css('min-width', '90px');

	if(!isHide) {

		$('.menu-item').each(function(index) {

			menu[index] = $(this).html();
			$(this).html('');
		});

		$(this).parent().animate({
			'width': '90px'
		}, 300);

		isHide = true;
	} else {

		$('.menu-item').each(function(index) {

			$(this).html(menu[index]);
		});

		$(this).parent().animate({
			'width': width + 'px'
		}, 300);

		isHide = false;
	}
});