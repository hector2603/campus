$(document).ready(function() {
  	$("select").select2();// Asignando a todos los selects a  ser select 2

  	$( "#asignar" ).submit(function( event ) {
  		var estudiante = '{ "estudiantes" : [' ;
  		var aux = 0;
  		$( "select" ).each(function( index ) {
  			var x = $( this ).select2('data')[0];
			console.log( x );
			if(aux != 0 ){
				estudiante += ',';
			}
			aux += 1;
			estudiante += '{ "id":"'+x.id+'" , "name":"'+x.text+'" }';
		});
  		estudiante += ']}';
  		//estudiante = JSON.parse(estudiante);
  		$("#q").val(estudiante);
  		console.log(estudiante);
	});
});