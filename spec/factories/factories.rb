# factory for generating users for tests
FactoryGirl.define do
  # alias friend is used with friendships and friend requests
  factory :user, aliases: [:friend_id] do
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password 'foobar'
  end

  factory :post do
    association :user
    body 'postbody'
  end

  factory :comment do
    association :user
    association :post
    body 'commentbody'
  end

  factory :like do
    association :user
    association :post
  end
end
