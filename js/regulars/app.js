$(function(){
	// Modal
	//var modal = $('#myModal');
	//var btn = $('#myBtn');

	$('.myBtn').each(function(i) {
		i++;
		$(this).on('click', function() {
			//debugger
			$('.myModal'+i).addClass('visible');
		});
		$('.close__modal').on('click',function(){
			$('.modal').removeClass('visible');
		});
	});
	$('#header_user_info_button').on('click', function(){
		$('.logged').addClass('user_menu')
	});
	$('.cierra__menu_usuario').on('click', function(){
		$('.logged').removeClass('user_menu')
	});
	$('#entrar').on('click', function(){
		$('.news').addClass('activo')
	});
	$('#close').on('click', function(){
		$('.news').removeClass('activo')
	});
	$('.news').on('click', function(){
		$('.news').removeClass('activo')
	});
	$('.block').on('click', function(e){
		e.stopPropagation();
	});
	$('.alert , .alert-danger').on('click', function(){
		$('.alert , .alert-danger').css({'display' : 'none'});
	});
	$('.toggle__nod').on('click', function(){
		$('#opc_account_form').removeClass('invisible')
		$('.toggle__nod').hide()
	});
	$('#each__title > h1').each(function(i){
		i++;
		$(this).attr('id','obj'+i);
	});
});
