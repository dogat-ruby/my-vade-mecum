# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    bk_title "MyString"
    bk_isbn 1
    bk_author "MyString"
  end
end
