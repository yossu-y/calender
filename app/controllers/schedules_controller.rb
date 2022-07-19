class SchedulesController < ApplicationController

  def index
    @schedule = Schedule.all
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

  private

  def schedule_params
    params.require(:schedule).permit(:title, :body, :start_time)
  end

end
