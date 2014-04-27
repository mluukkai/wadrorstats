class CreateVersionControls < ActiveRecord::Migration
  def change
    create_table :version_controls do |t|
      t.string :student_number
      t.string :last_name
      t.string :first_name
      t.string :email
      t.integer :course_id
      t.integer :student_id
      t.boolean :done

      t.timestamps
    end
  end
end
