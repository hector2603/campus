class HomeController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  def index

  	if current_user.rol ==3
  		@reports = Report.where(active: true)
	  	@course = Qualification.left_outer_joins(:course).distinct.select('course_id').where(user_id: current_user.id)
	  	@ids = []
	  	@course.each do |id|
		  @ids.push(id.course_id)
		end
	  	@courses = Course.find(@ids)
	  	respond_with(@usuarios,@courses)
  	else
	  	@reports = Report.where(active: true)
	  	@courses = Course.where("user_id = ? AND date_end > ?", current_user.id, Time.new)
	  	respond_with(@usuarios,@courses)
  	end
  end
end
