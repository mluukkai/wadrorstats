class AddMiniprojectIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :miniproject_id, :integer
  end
end
