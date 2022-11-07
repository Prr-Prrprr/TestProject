class Physician < User
  default_scope -> { where(:role => 'physician') }

  has_many :appointments
  has_many :patients, through: :appointments

end