class Habit < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_many :habit_logs, dependent: :destroy
end
