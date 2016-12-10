class ActivateUserController < ApplicationController
	before_action :authenticate_user!
	respond_to :html
	before_action :es_admin?, only:[:index, :create,:edit,:update]
	def index
		#print "Hola mundo desde index de autentificarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
		@usuarios = User.where(active: false)
		#puts @usuarios
		respond_with(@usuarios)
	end

	def show
		@usuario = User.find(params[:id])
		@promedioGeneral = Qualification.where(user_id: current_user.id).average('nota')
		@bronce = Qualification.where("user_id = ? AND nota >= ? AND nota < ?", current_user.id, 3, 4).count('nota')
		@plata = Qualification.where("user_id = ? AND nota >= ? AND nota < ?", current_user.id, 4, 4.5).count('nota')
		@oro = Qualification.where("user_id = ? AND nota >= ? AND nota < ?", current_user.id, 4.5, 5).count('nota')
		@diamante = Qualification.where("user_id = ? AND nota = ?", current_user.id, 5).count('nota')

		respond_with(@usuario, @promedioGeneral, @bronce, @plata, @oro, @diamante)
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
