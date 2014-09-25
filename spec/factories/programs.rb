# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :program do
    name "MyString"
    description "MyText"
    program_category_id 1
  end
end
