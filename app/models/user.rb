class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :phone, presence: true

  before_save :normalize_phone

  # attr_accessor :phone, :password, :username

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def admin?
    role == 'admin'
  end

  def doctor?
    role == 'doctor'
  end

  def patient?
    role == 'patient'
  end

  private

  def normalize_phone
    self.phone = Phonelib.parse(phone).full_e164.presence
  end
end
