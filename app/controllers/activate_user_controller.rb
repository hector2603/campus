class ActivateUserController < ApplicationController
	before_action :authenticate_user!
	respond_to :html
	before_action :es_admin?
	def index
		#print "Hola mundo desde index de autentificarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
		@usuarios = User.where(active: false)
		#puts @usuarios
		respond_with(@usuarios)
	end

	def show
		@usuario = User.find(params[:id])
		respond_with(@usuario)
	end

	def edit
		@usuario = User.find(params[:id])
		@usuario.update(active: true)
		respond_with(@usuario)
	end

	def update
    	@usuario = User.find(params[:id])
    	puts "actualizooooooooooooooooooooooooooooooooooooooooo"
		@usuario.update(active: true)
		redirect_to @usuario
  	end
end
