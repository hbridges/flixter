FactoryGirl.define do 
  factory :user do
    sequence :email do |n|
      "thisismyemail2#{n}@gmail.com"
    end
    password "mypassword"
    password_confirmation "mypassword"
  end

  factory :course do
  	title "Test title"
  	description "This is just a test"
  	cost 10
  end

end
