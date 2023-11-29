# spec/factories/tutors.rb
FactoryBot.define do
  factory :tutor do
    name { "John Doe" }
    email { "john.doe@example.com" }
    course
  end
end
