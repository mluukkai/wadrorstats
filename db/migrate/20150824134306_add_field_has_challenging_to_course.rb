class AddFieldHasChallengingToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :challenging, :boolean
  end
end
