class ActivateUserController < ApplicationController
	before_action :authenticate_user!
	respond_to :html
	before_action :es_admin?
	def index
		#print "Hola mundo desde index de autentificarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
		@usuarios = User.all
		respond_with(@usuarios)
	end
end
