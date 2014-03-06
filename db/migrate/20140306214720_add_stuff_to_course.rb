class AddStuffToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :link, :string
    add_column :courses, :title, :string
  end
end
