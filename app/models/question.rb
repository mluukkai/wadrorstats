class Question < ActiveRecord::Base
	belongs_to :questionnaire
    self.inheritance_column = :type 
    scope :free_questions, -> { where(type: 'Free_question') } 
	scope :multichoice_questions, -> { where(type: 'Multichoice_question') } 

    # We will need a way to know which animals
    # will subclass the Animal model
    def self.types
      %w(Free_question Multichoice_question)
    end
end
