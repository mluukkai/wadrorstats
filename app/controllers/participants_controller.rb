class ParticipantsController < ApplicationController
	before_action :authenticate, :except => [:create]

	def create
		p = Participant.create params.require(:participant).permit(:student_number, :last_name, :first_name, :miniproject_id)
		render json: p
	end
end