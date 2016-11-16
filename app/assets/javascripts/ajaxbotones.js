function activarUsuario(id){
	$.ajax({ url: "/activate_user/"+id+"/edit"}).done(function(data) {
		demo.showNotification('bottom','right',"El usuario ha sido activado",2);
		$("#"+id).remove();
	});
}