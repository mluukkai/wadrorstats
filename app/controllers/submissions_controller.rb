class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate, :only => [:index]

  def index
    @course = Course.current
    @submissions = Submission.all
  end

  def show
  end

  def new
    @course = Course.current
    @submission = Submission.new
    @submission.course = Course.current
    @submission.week = Course.current.current_week

    @submission.week = 1
    @submission.student_number = "012345678"
    @submission.first_name = "Matti"
    @submission.last_name = "Luukkainen"
    @submission.email = "mluukkai@iki.fi"
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.generate_digest
    @submission.course = Course.current

    if @submission.save
      subject = "[WADROR] Exercise submission for week #{@submission.week}"
      msg_body = "Link to your submission #{request.protocol}#{request.host_with_port}/submissions/#{@submission.identifier}"
      begin
        #NotificationMailer.email("mluukkai@iki.fi", @submission.email, msg_body, subject).deliver
      rescue
      end

      stats = @submission.course.week_statistics.find_by(week:@submission.week)
      stats.submissions += 1
      stats.completed_exercises += @submission.total
      stats.used_time += @submission.hours
      times = stats.times[@submission.hours] || 0
      stats.times[@submission.hours] = times+1
      exercises = stats.exercises[@submission.total] || 0
      stats.exercises[@submission.total] = exercises+1
      stats.save

      redirect_to submission_path(@submission.identifier), notice: 'Submission was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @submission.id = 0
  end

  def update
    if @submission.update(submission_params)
      redirect_to submission_path(@submission.identifier), notice: 'Submission was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @submission.destroy
    redirect_to submissions_url, root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find_by(identifier:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      allowed = :student_number, :last_name, :first_name, :week, :hours, :comments, :email, :github
      (1..Course.current.exercises_max).each do |i|
        allowed << "a#{i}".to_s
      end
      params.require(:submission).permit(allowed)
    end
end
