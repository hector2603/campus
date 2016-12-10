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


$(function() {

  // We can attach the `fileselect` event to all file inputs on the page
  $(document).on('change', ':file', function() {
    var input = $(this),
        numFiles = input.get(0).files ? input.get(0).files.length : 1,
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.trigger('fileselect', [numFiles, label]);
  });

  // We can watch for our custom `fileselect` event like this
  $(document).ready( function() {
      $(':file').on('fileselect', function(event, numFiles, label) {

          var input = $(this).parents('.input-group').find(':text'),
              log = numFiles > 1 ? numFiles + ' files selected' : label;

          if( input.length ) {
              input.val(log);
          } else {
              if( log ) alert(log);
          }

      });
  });
  
});
