class AddAcronymeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :acronyme, :string
  end
end
