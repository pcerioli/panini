# This will guess the User class
FactoryGirl.define do

  factory :user do
    fullname "John Doe"
  	sequence(:email) { |n| "user#{n}@panini.com" }
  	password "secret123"
  end

end


