FactoryBot.define do
  factory :patient do
    username { 'TestPatient' }
    password { '111111' }
    phone { '1234542090' }
    role { 'patient' }
  end

  factory :doctor do
    username { 'TestDoctor' }
    password { '222222' }
    phone { '1234345690' }
    role { 'doctor' }
  end
end