class Participant < ActiveRecord::Base
	belongs_to :miniproject

	def as_json(options)
  		super(:only => [:first_name, :last_name])
	end
end
