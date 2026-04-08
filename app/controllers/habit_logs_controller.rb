class HabitLogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @habit = current_user.habits.find(params[:habit_id])
    @habit_log = @habit.habit_logs.new
  end

  def create
    @habit = current_user.habits.find(habit_log_params[:habit_id])
    @habit_log = @habit.habit_logs.new(habit_log_params)
    if @habit_log.save
      redirect_to habit_path(@habit), notice: "記録を反映しました"
    else
      flash.now[:alert] = "記録の反映に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @habit_log = current_user.habit_logs.find(params[:id])
    habit = @habit_log.habit
    @habit_log.destroy
    redirect_to habit_path(habit), notice: "記録を削除しました"
  end

  private
  def habit_log_params
    params.require(:habit_log).permit(:habit_id, :date, :memo)
  end
end
