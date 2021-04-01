FactoryBot.define do
  factory :task do
    date { FFaker::Time.date }
    description { FFaker::Lorem.word }
    status { FFaker::Lorem.word}
    project_id { 1 }
  end
end
