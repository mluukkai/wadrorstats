class CoursesController < ApplicationController
  before_action :set_course, only: [:week_statistics, :show, :edit, :update, :destroy, :submissions]
  before_filter :authenticate, :except => [:show, :current, :submissions]

  def current
    redirect_to Course.current
  end

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def week_statistics
    @week_statistic = WeekStatistic.new course_id: @course.id, week: @course.current_week
  end

  def submissions
  end

  def feedbacks
    @course = Course.current
    @feedbacks = @course.feedbacks
  end

  def show
    @stats = @course.week_statistics.where("submissions>0").sort{ |x, y| y.week <=> x.week }
  end

  def new
    @course = Course.new
  end

  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        @course.weeks.each_with_index do |v,i|
          @course.week_statistics.create(week: i+1, exercises: {}, times: {})
        end
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :acronyme, :term, :link, :title, :current_week, :challenging, :weeks => [])
    end
end
