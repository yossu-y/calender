class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save
      redirect_to schedules_path, noticd: "スケジュールを登録しました！"
    else
      @schedule = Schedule.all
      render "index"
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
      redirect_to schedules_path, notice: "予定を削除しました"
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :body, :start_time)
  end

end
