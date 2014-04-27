class VersionControlsController < ApplicationController
  before_action :set_version_control, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :only => [:index]

  # GET /version_controls
  # GET /version_controls.json
  def index
    @version_controls = VersionControl.all
  end

  # GET /version_controls/1
  # GET /version_controls/1.json
  def show
  end

  # GET /version_controls/new
  def new
    @version_control = VersionControl.new
  end

  # GET /version_controls/1/edit
  def edit
  end

  # POST /version_controls
  # POST /version_controls.json
  def create
    @version_control = VersionControl.new(version_control_params)

    respond_to do |format|
      if @version_control.save
        format.html { redirect_to @version_control, notice: 'Version control was successfully created.' }
        format.json { render action: 'show', status: :created, location: @version_control }
      else
        format.html { render action: 'new' }
        format.json { render json: @version_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /version_controls/1
  # PATCH/PUT /version_controls/1.json
  def update
    respond_to do |format|
      if @version_control.update(version_control_params)
        format.html { redirect_to @version_control, notice: 'Version control was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @version_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /version_controls/1
  # DELETE /version_controls/1.json
  def destroy
    @version_control.destroy
    respond_to do |format|
      format.html { redirect_to version_controls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version_control
      @version_control = VersionControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_control_params
      params.require(:version_control).permit(:student_number, :last_name, :first_name, :email, :course_id, :student_id, :done)
    end
end
