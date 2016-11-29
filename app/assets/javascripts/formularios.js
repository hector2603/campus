$(document).ready(function() {
  $("select").select2();// Asignando a todos los selects a  ser select 2

  $( "#asignar" ).submit(function( event ) { // función para crear un objeto json para enviar al controlador con los estudiantes asignados a una materia
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

  $( "#calificar" ).submit(function( event ) { // función para crear objeto json para agregar la calificación de los estudiantes
    if (typeof estudiantes != "undefined"){
      var aux = 0 ; 
      $(".nota").each(function(index){
        estudiantes[aux].nota =  $(this).val()
        aux+=1;
      });
      var studentJson = '{ "estudiantes" : '+JSON.stringify(estudiantes)+'}' ;
      console.log(studentJson);
      $("#q").val(JSON.stringify(estudiantes));
    }
  }); 
});