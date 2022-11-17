class Doctor < User
  default_scope -> { where(:role => 'doctor') }
  scope :available_doctors, -> { left_joins(:appointments).where(appointments: {status: ['open', nil]}).group(:id).having('COUNT(*) < 10')}

  has_many :appointments
  has_many :patients, through: :appointments

  def category
    Category.find_by(id: category_id).name
  end

  def doctors
    Doctor.find_by(:id)
  end

  def appointment_doctor_id
    Appointment.find_by(:doctor_id)
  end
end