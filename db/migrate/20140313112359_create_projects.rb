class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :student_number
      t.string :last_name
      t.string :first_name
      t.string :email
      t.integer :course_id
      t.integer :student_id
      t.string :github

      t.timestamps
    end
  end
end
