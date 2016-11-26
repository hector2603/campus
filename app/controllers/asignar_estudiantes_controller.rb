class AsignarEstudiantesController < ApplicationController
	respond_to :html
	def new
		puts params[:course_id]
		@course = Course.find(params[:course_id])
		@estudiantes = User.all #where(rol: 3)
		respond_with(@course,@estudiantes) 
	end

	def create
		puts "se creooooooooooooooooooooooooooooooooooooooooooooooooooo"
		puts params[:q]
		redirect_to root_path
	end
end
