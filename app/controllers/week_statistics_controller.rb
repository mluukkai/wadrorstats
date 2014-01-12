class WeekStatisticsController < ApplicationController
  before_action :set_week_statistic, only: [:show, :edit, :update, :destroy]

  # GET /week_statistics
  # GET /week_statistics.json
  def index
    @week_statistics = WeekStatistic.all
  end

  # GET /week_statistics/1
  # GET /week_statistics/1.json
  def show
  end

  # GET /week_statistics/new
  def new
    @week_statistic = WeekStatistic.new
  end

  # GET /week_statistics/1/edit
  def edit
  end

  # POST /week_statistics
  # POST /week_statistics.json
  def create
    @week_statistic = WeekStatistic.new(week_statistic_params)

    respond_to do |format|
      if @week_statistic.save
        format.html { redirect_to @week_statistic, notice: 'Week statistic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @week_statistic }
      else
        format.html { render action: 'new' }
        format.json { render json: @week_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /week_statistics/1
  # PATCH/PUT /week_statistics/1.json
  def update
    respond_to do |format|
      if @week_statistic.update(week_statistic_params)
        format.html { redirect_to @week_statistic, notice: 'Week statistic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @week_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /week_statistics/1
  # DELETE /week_statistics/1.json
  def destroy
    @week_statistic.destroy
    respond_to do |format|
      format.html { redirect_to week_statistics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week_statistic
      @week_statistic = WeekStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_statistic_params
      params.require(:week_statistic).permit(:week, :course_id, :submissions, :completed_exercises, :used_time, :exercises, :times)
    end
end
