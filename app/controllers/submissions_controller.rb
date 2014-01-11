class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @course = Course.current
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @course = Course.current
    @submission = Submission.new
    @submission.week = 1
    @submission.course = Course.current
    @submission.student_number = "012345678"
    @submission.first_name = "Matti"
    @submission.last_name = "Luukkainen"
    @submission.email = "mluukkai@iki.fi"
  end

  # GET /submissions/1/edit
  def edit
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.generate_digest
    @submission.course = Course.current

    if @submission.save
      subject = "[WADROR] Exercise submission for week #{@submission.week}"
      msg_body = "Link to your submission http://localhost:3000/submissions/#{@submission.identifier}"
      begin
        NotificationMailer.email("mluukkai@iki.fi", @submission.email, msg_body, subject).deliver
      rescue
      end

      redirect_to submission_path(@submission.identifier), notice: 'Submission was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find_by(identifier:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      allowed = :student_number, :last_name, :first_name, :week, :hours, :comments, :email
      (1..Course.current.exercises_max).each do |i|
        allowed << "a#{i}".to_s
      end
      params.require(:submission).permit(allowed)
    end
end
