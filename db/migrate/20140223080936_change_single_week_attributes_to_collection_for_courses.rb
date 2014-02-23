class ChangeSingleWeekAttributesToCollectionForCourses < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        add_column :courses, :weeks, :text
        Course.all.each do |c|
          c.weeks = [c.week1, c.week2, c.week3, c.week4, c.week5, c.week6]
          c.save
        end
        1.upto(6) do |i|
          remove_column :courses, "week#{i}"
        end
      end
      dir.down do
        1.upto(6) do |i|
          add_column :courses, "week#{i}", :integer
        end
        Course.all.each do |c|
          c.week1 = c.weeks[0]
          c.week2 = c.weeks[1]
          c.week3 = c.weeks[2]
          c.week4 = c.weeks[3]
          c.week5 = c.weeks[4]
          c.week6 = c.weeks[5]
          c.save
        end
        remove_column :courses, :weeks
      end

    end
  end
end
