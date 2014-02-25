class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_number
      t.string :last_name
      t.string :first_name
      t.integer :total
      t.string :weeks

      t.timestamps
    end
  end
end
