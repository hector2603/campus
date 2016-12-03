function submitAsignar(event){ // función auxiliar para crear el json en asignar estuciantes
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
}

function submitCalificar(event){// función auxiliar para crear el json en calificar estuciantes
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
}
