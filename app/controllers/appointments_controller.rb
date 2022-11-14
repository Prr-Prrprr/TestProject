class AppointmentsController < ApplicationController
  def index
    
  end

  def new
    @doctor = User.find_by(id: params[:doctor_id])
    @month = params[:month]
  end
end