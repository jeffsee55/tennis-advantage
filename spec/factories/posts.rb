# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    body "MyText"
    tags "MyTags"
    page "MyPage"
    context "MyContext"
  end
end
