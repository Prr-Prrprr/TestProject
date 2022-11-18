class Doctor < User
  default_scope -> { where(:role => 'doctor') }
  scope :available_doctors, -> { left_joins(:appointments).where(appointments: {status: ['open', nil]}).group(:id).having('COUNT(*) < 10')}

  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :category
end