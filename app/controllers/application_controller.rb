class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	def es_admin?
		if current_user.rol!=1
			print "no es admin                    "
			flash[:notice] = "Necesitas ser Administrador para accerder a esta función" 
			redirect_to root_path
		else
			print "sí es admin                    "
		end
	end

	def es_profesor?
		if current_user.rol<=2
			print "no es profesor                    "
			flash[:notice] = "Necesitas ser Profesor para accerder a esta función" 
			redirect_to root_path
		else
			print "sí es profesor                    "
		end
	end
end
