class HabitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @habits = current_user.habits
  end

  def show
    @habit = current_user.habits.find(params[:id])
    @habit_logs = @habit.habit_logs
  end

  def new
    @habit = current_user.habits.new
  end

  def create
    @habit = current_user.habits.new(habit_params)
    if @habit.save
      redirect_to root_path, notice: "習慣を登録しました"
    else
      render :new, notice: "習慣の登録に失敗しました"
    end
  end

  def edit
    @habit = current_user.habits.find(params[:id])
  end

  def update
    @habit = current_user.habits.find(params[:id])
    if @habit.update(habit_params)
      redirect_to root_path, notice: "習慣を編集しました"
    else
      render :edit, notice: "習慣の編集に失敗しました"
    end
  end

  def destroy
    @habit = current_user.habits.find(params[:id])
    @habit.destroy
    redirect_to root_path, notice: "習慣を削除しました"
  end

  private
  def habit_params
    params.require(:habit).permit(:title, :detail)
  end
end
