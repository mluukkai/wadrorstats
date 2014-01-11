class AddCurrentWeekToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :current_week, :integer
  end
end
