class AsignarEstudiantesController < ApplicationController
	before_action :authenticate_user!
	respond_to :html
	before_action :es_profesor?, only:[:new, :create,:edit,:update]
	def new
		puts params[:course_id]
		@course = Course.find(params[:course_id])
		@estudiantes = User.all #where(rol: 3, active: true)
		respond_with(@course,@estudiantes) 
	end

	def create
		puts "se creooooooooooooooooooooooooooooooooooooooooooooooooooo"
		estudiantes = JSON(params[:q])
		estudiantes["estudiantes"].uniq!{|s| s.first}# elimina los estudiantes duplicados
		estudiantes["estudiantes"].each do |i|
			@qualification = Qualification.new(course_id: params[:course_id] , user_id: i["id"], nota: 0)
			@qualification.save
		end
		puts estudiantes["estudiantes"]
		redirect_to root_path
	end
end
