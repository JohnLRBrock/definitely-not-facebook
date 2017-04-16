# factory for generating users for tests
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password 'foobar'
  end
  factory :post do
  end
  factory :comment do
  end
  factory :like do
  end
  factory :friend_request do
  end
  factory :friend_request do
  end
end