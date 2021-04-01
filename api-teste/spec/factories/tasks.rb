FactoryBot.define do
  factory :task do
    date { FFaker::Time.date }
    description { FFaker::Lorem.word }
    status { FFaker::Lorem.word  }
    project { create(:project) }
  end
end
