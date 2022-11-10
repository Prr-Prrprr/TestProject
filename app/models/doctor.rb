class Doctor < User
  default_scope -> { where(:role => 'doctor') }

  has_many :appointments
  has_many :patients, through: :appointments

end