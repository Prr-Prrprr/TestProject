class Patient < User
  default_scope -> { where(:role => 'patient') }

  has_many :appointments
  has_many :doctors, through: :appointments

  validates_uniqueness_of :username

end