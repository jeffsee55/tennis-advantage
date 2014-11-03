# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_line_1 "123 Street"
    address_line_2 "MyString"
    township "MyString"
    city "MyString"
    country "MyString"
    zip "MyString"
  end
end
