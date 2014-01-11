class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :term
      t.integer :week1
      t.integer :week2
      t.integer :week3
      t.integer :week4
      t.integer :week5
      t.integer :week6
      t.boolean :active

      t.timestamps
    end
  end
end
