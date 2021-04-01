FactoryBot.define do
  factory :task do
    date { "2021-04-01" }
    description { "MyString" }
    status { "MyString" }
    project_id { 1 }
  end
end
