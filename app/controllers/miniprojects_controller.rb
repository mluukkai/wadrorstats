class MiniprojectsController < ApplicationController
  before_action :set_miniproject, only: [:show, :edit, :destroy]
  before_action :authenticate, :only => [:list, :edit, :destroy]

  # GET /miniprojects
  # GET /miniprojects.json
  def index
    @miniprojects = Miniproject.all
  end

  def list
    @miniprojects = Miniproject.all
  end

  # GET /miniprojects/1
  # GET /miniprojects/1.json
  def show
  end

  # GET /miniprojects/new
  def new
    @miniproject = Miniproject.new
  end

  # GET /miniprojects/1/edit
  def edit
  end

  # POST /miniprojects
  # POST /miniprojects.json
  def create
    @miniproject = Miniproject.new(miniproject_params)

    @miniproject.generate_digest

    email = params.require(:miniproject).permit(:email)

    send_email(@miniproject, email)

    if @miniproject.save
      redirect_to miniproject_path(@miniproject.identifier), notice: 'Miniproject was successfully created.' 
    else
      render action: 'new' 
    end
  end

  # PATCH/PUT /miniprojects/1
  # PATCH/PUT /miniprojects/1.json
  def update
    id = params.require(:miniproject).permit(:id)[:id]
    @miniproject = Miniproject.find_by(identifier:id)
    if @miniproject.update(miniproject_params)
      redirect_to miniproject_path(@miniproject.identifier), notice: 'Github url added' 
    else
      #byebug
      render action: 'show' 
    end
  end

  # DELETE /miniprojects/1
  # DELETE /miniprojects/1.json
  def destroy
    @miniproject.destroy
    respond_to do |format|
      format.html { redirect_to miniprojects_url }
      format.json { head :no_content }
    end
  end

  private

    def send_email(miniproject, email)
      subject = "[#{Course.current.acronyme}] Miniproject creater"
      msg_body = "Link to miniproject page #{request.protocol}#{request.host_with_port}/miniprojects/#{miniproject.identifier}"
      begin
        NotificationMailer.email("mluukkai@iki.fi", email, msg_body, subject).deliver unless Rails.env.development?
      rescue
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_miniproject
      @miniproject = Miniproject.find_by(identifier:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miniproject_params
      params.require(:miniproject).permit(:name, :github, :course_id)
    end
end
