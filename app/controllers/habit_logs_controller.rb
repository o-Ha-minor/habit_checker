class HabitLogsController < ApplicationController
  def new
    @habit_log = HabitLog.new(habit_id: params[:habit_id])
  end

  def create
    @habit_log = HabitLog.new(habit_log_params)
    if @habit_log.save
      redirect_to habit_path(@habit_log.habit), notice: "記録を反映しました"
    else
      render :new
    end
  end

def destroy
   @habit_log = HabitLog.find(params[:id])
   @habit_log.destroy
   redirect_to root_path, notice: "記録を削除しました"
end

  private
  def habit_log_params
    params.require(:habit_log).permit(:habit_id, :date, :memo)
  end
end
