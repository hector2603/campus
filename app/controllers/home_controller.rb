class HomeController < ApplicationController
  before_action :authenticate_user!
  respond_to :html
  def index
  	 @reports = Report.where(active: true)
  	 respond_with(@usuarios)
  end
end
