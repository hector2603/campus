class HomeController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  def index
  	 @reports = Report.where(active: true)
  	 @courses = Course.where(user_id: current_user.id)
  	 respond_with(@usuarios,@courses)
  end
end
