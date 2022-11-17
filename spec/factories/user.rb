FactoryBot.define do
  factory :user do
    username { 'TestPatient' }
    password { '111111' }
    phone { '1234542090' }
    role { 'patient' }
  end
end