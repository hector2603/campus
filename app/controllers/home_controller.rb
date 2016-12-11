class HomeController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  def index
#User.find(3).qualification.each do |t| i.push(t.course)  end
# i[0].qualifications.where(user_id: 3)
  	@reports = Report.where(active: true)
  	if current_user.rol <=2
  		@courses = Course.where('date_end > ? AND active = ? AND user_id = ?', Time.new, true,current_user.id).distinct
  		@courses_anteriores = Course.where('date_end < ? OR active = ? AND user_id = ?', Time.new, false,current_user.id).distinct
	  	"""@course = Qualification.left_outer_joins(:course).distinct.select('course_id').where(user_id: current_user.id)
	  	@ids = []
	  	@course.each do |id|
		  @ids.push(id.course_id)
		end
	  	@courses = Course.find(@ids)
	  	respond_with(@usuarios,@courses)"""
  	else
	  	#@courses = Course.where("user_id = ? AND date_end > ?", current_user.id, Time.new)
	  	@courses = []
	  	@courses_anteriores = []
  		current_user.qualification.each do |t|
			i = t.course  
			if i.active
				@courses.push(i)
			else
				@courses_anteriores.push(i)
			end
  		end
  	end
  	puts(@courses.each,@courses_anteriores.each)
	respond_with(@reports,@courses,@courses_anteriores)
  end
end
