class Task < ApplicationRecord
  belongs_to :project
  validates :date, :description, :status, :project_id, presence: true
end
