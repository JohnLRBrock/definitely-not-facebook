# factory for generating users for tests
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password 'foobar'
  end
  factory :post do
    user
    body 'postbody'
  end
  factory :comment do
    user
    post
    body 'commentbody'
  end
  factory :like do
    user
    post
  end
end