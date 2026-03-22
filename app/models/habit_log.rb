class HabitLog < ApplicationRecord
  belongs_to :habit
  validates :date, presence: true
end
