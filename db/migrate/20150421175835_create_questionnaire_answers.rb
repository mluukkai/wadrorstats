class CreateQuestionnaireAnswers < ActiveRecord::Migration
  def change
    create_table :questionnaire_answers do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
