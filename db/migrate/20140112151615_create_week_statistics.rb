class CreateWeekStatistics < ActiveRecord::Migration
  def change
    create_table :week_statistics do |t|
      t.integer :week
      t.integer :course_id
      t.integer :submissions
      t.integer :completed_exercises
      t.integer :used_time
      t.text :exercises
      t.text :times

      t.timestamps
    end
  end
end
