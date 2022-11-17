FactoryBot.define do
  factory :appointment do
    doctor_id { '1' }
    patient_id { '1' }
    date { 'Sat, 03 Dec 2022 ' }
  end
end
