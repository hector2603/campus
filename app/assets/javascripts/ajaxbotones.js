function activarUsuario(id){
	$.ajax({ url: "/activate_user/"+id+"/edit"}).done(function(data) {
		demo.showNotification('bottom','right',"se activó el usuario",2);
		$("#"+id).remove();
	});
}