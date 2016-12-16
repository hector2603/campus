class ActivateUserController < ApplicationController
	before_action :authenticate_user!
	respond_to :html
	before_action :es_admin?, only:[:index, :create,:edit,:update]
	def index
		#print "Hola mundo desde index de autentificarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
		@usuarios = User.where(active: false)
		#puts @usuarios
		@allUser = User.all
		respond_with(@usuarios,@allUser)
	end

	def show
		@usuario = User.find(params[:id])
		@promedioGeneral = Qualification.where(user_id: current_user.id).average('nota')
		@bronce = Qualification.where("user_id = ? AND nota >= ? AND nota < ?", current_user.id, 3, 4).count('nota')
		@plata = Qualification.where("user_id = ? AND nota >= ? AND nota < ?", current_user.id, 4, 4.5).count('nota')
		@oro = Qualification.where("user_id = ? AND nota >= ? AND nota < ?", current_user.id, 4.5, 5).count('nota')
		@diamante = Qualification.where("user_id = ? AND nota = ?", current_user.id, 5).count('nota')

		# fecha del curso más viejo
		aux = User.find(current_user).qualification.joins(:course).order("courses.date_end")
		if aux.first
			date = aux.first.course.date_end 
		end
		# fecha del cuso más nuevo
		aux = User.find(current_user).qualification.joins(:course).order("courses.date_end")
		if aux.last
			date_curso_mas_nuevo = aux.last.course.date_end
		end
		@promedios = []

		if date and date_curso_mas_nuevo
			inicio_del_ano = date.beginning_of_year
			mitad_del_ano = inicio_del_ano + 6.month
			date_curso_mas_nuevo = date_curso_mas_nuevo + 6.month		
			fin_del_ano = date.end_of_year
			semestre = ""

			if date <= mitad_del_ano 
				inicio_semestre = inicio_del_ano
			else 
				inicio_semestre = mitad_del_ano
			end

			fin_semestre = inicio_semestre + 6.month

			while fin_semestre <= date_curso_mas_nuevo do
				prom = User.find(current_user).qualification.joins(:course).where("courses.date_end >= ? AND courses.date_end <= ? ", inicio_semestre, fin_semestre).average("nota")
				if prom 
					prom = prom.to_digits
					añoSemestre = inicio_semestre.year
					if inicio_semestre.month < 7
						semestre = "I"
					else
						semestre = "II"
					end
				else
					prom = 0
					if inicio_semestre.month < 7
						semestre = "I"
					else
						semestre = "II"
					end
				end
				@promedios.push({"promedio": prom, "semestre": semestre, "añoSemestre": añoSemestre})
				inicio_semestre = fin_semestre
				fin_semestre = fin_semestre + 6.month
			end
		end
		respond_with(@usuario, @promedioGeneral, @bronce, @plata, @oro, @diamante, @promedios)
	end

	def edit
		@usuario = User.find(params[:id])
		@usuario.update(active: true)
		respond_with(@usuario)
	end

	def update
    	@usuario = User.find(params[:id])
    	#puts "actualizooooooooooooooooooooooooooooooooooooooooo"
		@usuario.update(active: true)
		redirect_to @usuario
  	end
end
