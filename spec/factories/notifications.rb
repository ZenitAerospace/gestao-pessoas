FactoryGirl.define do
  factory :notification do
    message "MyText"
    user ""
    viewed false
    title "MyString"
  end
end
