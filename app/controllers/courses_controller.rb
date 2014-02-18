class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :submissions]

  before_filter :authenticate, :except => [:show, :current]

  def current
    redirect_to Course.current
  end

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def submissions

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
      params.require(:course).permit(:name, :term, :current_week, :week1, :week2, :week3, :week4, :week5, :week6)
    end
end
