require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let!(:doctor) { create(:doctor, phone: '1-212-456-7890') }
  
  it 'check is normalize_phone method works' do
    expect(doctor.phone).to eq('+12124567890')
  end
end