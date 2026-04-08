class HabitLog < ApplicationRecord
  belongs_to :habit
  validates :date, presence: true
  validates :date, uniqueness: {
   scope: :habit_id,
   messege: "記録は1日に一度です" }
end
