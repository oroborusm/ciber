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
});
