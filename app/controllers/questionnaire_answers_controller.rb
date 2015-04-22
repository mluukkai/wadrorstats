class QuestionnaireAnswersController < ApplicationController
  before_action :set_questionnaire_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :only => [:destroy]

  # GET /questionnaire_answers
  # GET /questionnaire_answers.json
  def index
    @questionnaire_answers = QuestionnaireAnswer.all
  end

  # GET /questionnaire_answers/1
  # GET /questionnaire_answers/1.json
  def show
  end

  # GET /questionnaire_answers/new
  def new
    @questionnaire_answer = QuestionnaireAnswer.new
  end

  # GET /questionnaire_answers/1/edit
  def edit
  end

  # POST /questionnaire_answers
  # POST /questionnaire_answers.json
  def create
    @questionnaire_answer = QuestionnaireAnswer.new(questionnaire_answer_params)

    respond_to do |format|
      if @questionnaire_answer.save
        format.html { redirect_to @questionnaire_answer, notice: 'Questionnaire answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @questionnaire_answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @questionnaire_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaire_answers/1
  # PATCH/PUT /questionnaire_answers/1.json
  def update
    puts params[:ju]
    @questionnaire_answer = QuestionnaireAnswer.find_by(identifier:params[:juuh])
    puts " on id"
    puts @questionnaire_answer.id
    if @questionnaire_answer.update(questionnaire_answer_params)
      redirect_to questionnaire_answer_path(@questionnaire_answer), notice: 'Questionnaire answer updated' 
    else
      #byebug
      render action: 'show' 
    end
  end

  # DELETE /questionnaire_answers/1
  # DELETE /questionnaire_answers/1.json
  def destroy
    @questionnaire_answer.destroy
    respond_to do |format|
      format.html { redirect_to questionnaire_answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire_answer
      @questionnaire_answer = QuestionnaireAnswer.find_by(identifier:params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_answer_params
      params.require(:questionnaire_answer).permit(:juuh, :name, :identifier, :questions_attributes => [:id, :answer])
    end
end
