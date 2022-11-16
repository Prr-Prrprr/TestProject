class AppointmentsController < ApplicationController
  def index
    
  end

  def new
    @doctor = User.find_by(id: params[:doctor_id])
    @month = params[:month]
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Your appointment successfully created!'
    end
  end

  def show
    @appointments = Appointment.includes(:doctor).where(patient_id: current_user.id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date)
  end
end