class PeerReviewsController < ApplicationController
  before_action :set_peer_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :except => [:new, :create]

  # GET /peer_reviews
  # GET /peer_reviews.json
  def index
    @peer_reviews = PeerReview.all(:order => 'miniproject_id, name')
  end

  # GET /peer_reviews/1
  # GET /peer_reviews/1.json
  def show
  end

  # GET /peer_reviews/new
  def new
    @peer_review = PeerReview.new
  end

  # GET /peer_reviews/1/edit
  def edit
  end

  # POST /peer_reviews
  # POST /peer_reviews.json
  def create

    reviews = []
    params[:scores].keys.each{ |name|
      score = params[:scores][name]
      peer_review = PeerReview.new(name:name, score:score, miniproject_id:params[:project][:id])
      peer_review.save
      reviews << peer_review
    }

    render json: reviews

  end

  # PATCH/PUT /peer_reviews/1
  # PATCH/PUT /peer_reviews/1.json
  def update
    respond_to do |format|
      if @peer_review.update(peer_review_params)
        format.html { redirect_to @peer_review, notice: 'Peer review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @peer_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peer_reviews/1
  # DELETE /peer_reviews/1.json
  def destroy
    @peer_review.destroy
    respond_to do |format|
      format.html { redirect_to peer_reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peer_review
      @peer_review = PeerReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peer_review_params
      params.require(:peer_review).permit(:target, :score, :miniproject_id)
    end
end
