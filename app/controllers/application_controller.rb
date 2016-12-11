class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	def es_admin?
		if current_user.rol!=1
			print "no es admin                    "
			flash[:notice] = "Necesitas ser Administrador para accerder a esta función" 
			redirect_to root_path
		else
			#print "sí es admin                    "
		end
	end

	def es_profesor?
		if current_user.rol>2
			print "no es profesor                    "
			flash[:notice] = "Necesitas ser Profesor para accerder a esta función" 
			redirect_to root_path
		else
			#print "sí es profesor                    "
		end
	end

	def verificar_curso
		if params[:id]
			course = Course.find(params[:id])
		else
			course = Course.find(params[:course_id])
		end
		if course.date_end < Time.new
			course.update(active: false)
			#flash[:notice] = "Este Curso ya terminó, la información se puede consultar" 
		end
	end

	def curso_activo?
		if params[:id]
			course = Course.find(params[:id])
		else
			course = Course.find(params[:course_id])
		end
		if !course.active
			puts "aquiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
			flash[:notice] = "Este Curso ya terminó, la información se puede consultar, pero no se puede editar ni calificar estudiantes" 
			redirect_to course_user_path(course.id)
			#return false
		else
			#return true
		end
	end
end
