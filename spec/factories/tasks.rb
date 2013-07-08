FactoryGirl.define do
  factory :task do
    user_id     1
    name        "MyString"
    description "Test Description"
    done        false
  end
end
