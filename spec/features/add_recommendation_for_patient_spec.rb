require 'rails_helper'

RSpec.feature 'Doctor features', type: :feature do
  context 'doctor give recommendation to patient' do
    let(:doctor) { create(:doctor) }
    let(:patient) { create(:patient) }

    before do
      login_as(doctor, scope: :user)
      @appointment = Appointment.create(doctor_id: doctor.id, patient_id: patient.id, date: 'Sat, 03 Dec 2022')
    end

    it 'gives recommendation' do
      visit root_path
      expect(page).to have_content('Profile')
      click_on 'My appointments'
      expect(page).to have_content('Give recommendation')
      expect(page).to have_content('2022-12-03')
      expect(page).to have_content('TestPatient')
      click_on 'Give recommendation'
      expect(page).to have_content('Recommendation')
      fill_in 'Recommendation', with: "Doctor's recommendation"
      click_on 'Send'
      expect(page).to have_content("Doctor's recommendation")
      expect(page).to have_content('closed')
    end
  end
end