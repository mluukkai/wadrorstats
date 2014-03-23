class CreateMiniprojects < ActiveRecord::Migration
  def change
    create_table :miniprojects do |t|
      t.string :name
      t.string :github
      t.integer :course_id

      t.timestamps
    end
  end
end
