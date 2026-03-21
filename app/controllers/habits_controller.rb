class HabitsController < ApplicationController
  def index
    if current_user
      @current_user = current_user
      @habits = @current_user.habits
    else
      redirect_to new_user_session_path, alert: "ログインしてください"

    end
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new
  end

  def create
    @current_user = current_user
    @habit = Habit.new(habit_params)
    @habit.user_id = @current_user.id
    if @habit.save
      redirect_to root_path, notice: "習慣を登録しました"
    else
      redirect_to root_path
    end
  end

  def edit
    @current_user = current_user
    @habit = Habit.find(params[:id])
  end

  def update
    @current_user = current_user
    @habit = Habit.find(params[:id])
    @habit.update(habit_params)
    redirect_to root_path notice: "習慣を編集しました"
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.destroy
    redirect_to root_path notice: "習慣を削除しました"
  end

  private
  def habit_params
    params.require(:habit).permit(:title, :detail)
  end
end
