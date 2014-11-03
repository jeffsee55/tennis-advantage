# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Jeff"
    last_name "See"
    email "jeff@example.com"
    password "password"
    phone "MyString"
  end
end
