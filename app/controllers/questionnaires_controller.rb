class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :only => [:destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
    @questionnaire.id = Questionnaire.maximum(:id) + 1
    @alkup = Questionnaire.find(1)
    @alkup.questions.each do |q|
      @uusi = copy_question(q)
      @questionnaire.questions.push(@uusi)
    end
    @questionnaire.save!
  end

  def copy
    @questionnaire = Questionnaire.find(params[:id])
    @new = Questionnaire.new
    @new.id = Questionnaire.maximum(:id) + 1
    @questionnaire.questions.each do |q|
      @uusi = copy_question(q)
      @new.questions.push(@uusi)
    end
    @new.name = @questionnaire.name
    @new.generate_digest
    @new.save!
    redirect_to edit_questionnaire_path(@new.identifier)
  end

  def copy_question(q)
    if q.type == "Free_question"
        @uusi = Free_question.new
    elsif q.type == "Multichoice_question"
        @uusi = Multichoice_question.new
        @uusi = copy_options(q)
    end
    @uusi.description = q.description
    @uusi.questionnaire_id = @new.id
    @uusi.save!
    return @uusi
  end

  def copy_options(q)
    @uusi.option1 = q.option1
    @uusi.option2 = q.option2
    @uusi.option3 = q.option3
    @uusi.option4 = q.option4
    @uusi.option5 = q.option5
    @uusi.save!
    return @uusi
  end
  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render action: 'show', status: :created, location: @questionnaire }
      else
        format.html { render action: 'new' }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    @questionnaire = Questionnaire.find_by(identifier:params[:identifier])
    if @questionnaire.update(questionnaire_params)
      redirect_to questionnaire_path(@questionnaire), notice: 'Questionnaire updated' 
    else
      #byebug
      render action: 'show' 
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find_by(identifier:params[:identifier])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:name, :questions_attributes => [:id, :answer])
    end
end
