# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    subject "MyText"
    message "MyText"
    email "MyString"
    name "MyString"
    phone "MyString"
  end
end
