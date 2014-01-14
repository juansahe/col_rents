FactoryGirl.define do
  factory :user do
    name                    "Juan David Sanchez"
    email                   "juansahe@gmail.com"
    password                "foobar"
    password_confirmation   "foobar"
  end
end