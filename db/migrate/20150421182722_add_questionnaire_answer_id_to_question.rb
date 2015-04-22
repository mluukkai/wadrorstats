class AddQuestionnaireAnswerIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :questionnaire_answer_id, :integer
  end
end
