# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street "MyString"
    township "MyString"
    city "MyString"
    country "MyString"
    zip "MyString"
  end
end
