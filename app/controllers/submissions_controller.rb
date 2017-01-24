class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :only => [:index, :new_admin]

  def index
    @course = Course.current
    @submissions = Submission.order(updated_at: :desc)
  end

  def public
    @submissions = Submission.where( course_id:Course.current.id).order(updated_at: :desc)
  end

  def show
  end

  def new_admin
    @course = Course.current
    @submission = Submission.new course:Course.current, week:Course.current.current_week
    @submission.github = "https://github.com/mluukkai/WebPalvelinohjelmointi2017"
    @submission.email = "mluukkai@iki.fi"
    @submission.prefill_fields_if_in_development
  end

  def new
    @course = Course.current
    @submission = Submission.new course:Course.current, week:Course.current.current_week
    @submission.prefill_fields_if_in_development
  end

  def create
    @submission = Submission.new_with_digest(submission_params)

    admin = params['submission']['admin']
    unless admin
      @submission.week = Course.current.current_week
    end

    if @submission.save
      send_email(@submission) unless admin
      Course.current.take_into_account_in_stats(@submission)

      redirect_to submission_path(@submission.identifier), notice: 'Submission was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @submission.id = 0
    if @submission.week<Course.current.current_week
      redirect_to submission_path(@submission.identifier), notice: 'Submission can not be updated.'
    else
    end
  end

  def update
    old_submission = Submission.find_by(identifier:params[:id])

    if @submission.update(submission_params)
      Course.current.update_stats_with(@submission, old_submission)

      redirect_to submission_path(@submission.identifier), notice: 'Submission was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @submission.destroy
    redirect_to submissions_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find_by(identifier:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      allowed = :student_number, :last_name, :first_name, :week, :hours, :comments, :email, :github, :challenging
      (1..Course.current.exercises_max).each do |i|
        allowed << "a#{i}".to_s
      end
      params.require(:submission).permit(allowed)
    end

  def send_email(submission)
    subject = "[#{Course.current.acronyme}] Exercise submission for week #{submission.week}"
    msg_body = "Link to your submission #{request.protocol}#{request.host_with_port}/submissions/#{submission.identifier}"
    begin
      NotificationMailer.email("mluukkai@iki.fi", submission.email, msg_body, subject).deliver unless Rails.env.development?
    rescue
    end
  end

  def if_in_development_prefill_fields_of(submission)
    if Rails.env.development?
      submission.student_number = "012345678"
      submission.first_name = "Matti"
      submission.last_name = "Luukkainen"
      submission.email = "mluukkai@iki.fi"
    end
  end
end
