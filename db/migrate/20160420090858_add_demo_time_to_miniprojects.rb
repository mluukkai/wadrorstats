class AddDemoTimeToMiniprojects < ActiveRecord::Migration
  def change
    add_column :miniprojects, :demo, :string
  end
end
