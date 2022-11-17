require 'rails_helper'

RSpec.describe "Create category", type: :request do
  let(:patient) { create(:patient) }

  before do
    login_as(patient, scope: :user)
    @category = Category.create(name: 'TestCategory')
    @doctor = Doctor.create(username: 'TestDoctor', phone: '12345432', password: '111111', role: 'doctor', category_id: @category.id)
  end

  it 'creates appointment' do
    visit root_path
    expect(page).to have_content('Profile')
    click_on 'Choose type of doctor'
    expect(page).to have_content('Categories')
    click_on @category.name
    expect(page).to have_content(@category.name)
    click_on @doctor.username
    expect(page).to have_content('Create appointment')
    click_on 'Create appointment'
    expect(page).to have_content('Previous')
    click_on '-05'
    expect(page).to have_content('Patient')
    click_on 'Create'
    expect(page).to have_content('Your appointment successfully created!')
  end
end