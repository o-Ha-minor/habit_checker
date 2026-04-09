class HabitLog < ApplicationRecord
  belongs_to :habit
  validates :date, presence: true
  validates :date, uniqueness: {
   scope: :habit_id,
   message: "記録は1日に一度です" }
   validate :date_cannot_be_future

  private

  def date_cannot_be_future
    if date.present? && date > Time.zone.today
      errors.add(:date, :future_date)
    end
  end
end
