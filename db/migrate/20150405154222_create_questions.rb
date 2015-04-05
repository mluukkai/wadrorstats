class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.integer :questionnaire_id
      t.string :description

      t.timestamps
    end
  end
end
