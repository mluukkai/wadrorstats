class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :student_number
      t.string :last_name
      t.string :first_name
      t.integer :week
      t.integer :points
      t.string :identifier
      t.integer :hours
      t.text :comments
      t.string :email
      t.boolean :a1
      t.boolean :a2
      t.boolean :a3
      t.boolean :a4
      t.boolean :a5
      t.boolean :a6
      t.boolean :a7
      t.boolean :a8
      t.boolean :a9
      t.boolean :a10
      t.boolean :a11
      t.boolean :a12
      t.boolean :a13
      t.boolean :a14
      t.boolean :a15
      t.boolean :a16
      t.boolean :a17
      t.boolean :a18
      t.boolean :a19
      t.boolean :a20
      t.boolean :a21

      t.timestamps
    end
  end
end
