class CourseUsersController < ApplicationController
	before_action :authenticate_user!
	before_action :es_profesor?, only:[:new, :create,:edit,:update]
	def index
		@courses = Course.where(user_id: current_user.id)
	end

	def show
		@course = Course.find(params[:id])
	end
end
