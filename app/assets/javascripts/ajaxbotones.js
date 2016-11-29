function activarUsuario(id){
	$.ajax({ url: "/activate_user/"+id+"/edit"}).done(function(data) {
		demo.showNotification('bottom','right',"El usuario ha sido activado",2);
		$("#"+id).remove();
	});
}

function agregarSelect2Estudiante(){
	if (typeof estudiantes != "undefined"){
		var sel = $('<select>').appendTo('#contenedorEstudiantes');
		$(estudiantes).each(function() {
		 sel.append($("<option>").attr('value',this.id).text(this.name));
		});
		sel.select2();
	}
}