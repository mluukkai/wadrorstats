class QuestionnaireAnswer < ActiveRecord::Base
	has_many :questions
	accepts_nested_attributes_for :questions

	def generate_digest
    	self.identifier = Digest::SHA1.hexdigest "#{name}#{Time.now}"
	end
end
