FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "person-#{n}"
    end
    password { 'MyString01' }
  end
end
