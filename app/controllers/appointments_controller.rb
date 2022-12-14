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
    if current_user.role == 'patient'
      @appointments = Appointment.includes(:doctor).where(patient_id: current_user.id)
    elsif current_user.role == 'doctor'
      @appointments = Appointment.includes(:patient).where(doctor_id: current_user.id)
    end
  end

  def edit
    find_appointment
  end

  def update
    find_appointment
    if @appointment.update(appointment_params)
      redirect_to appointment_path, notice: 'Appointment was updated'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date, :recommendation, :status)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
end