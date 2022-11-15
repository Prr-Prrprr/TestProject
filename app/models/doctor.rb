class Doctor < User
  default_scope -> { where(:role => 'doctor') }
  scope :available_doctors, -> { joins(:appointments).group(:id).having('COUNT(*) < 10') }

  has_many :appointments
  has_many :patients, through: :appointments

  def category
    Category.find_by(id: category_id).name
  end

end