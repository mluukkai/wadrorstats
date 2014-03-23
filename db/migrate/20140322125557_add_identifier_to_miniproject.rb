class AddIdentifierToMiniproject < ActiveRecord::Migration
  def change
    add_column :miniprojects, :identifier, :string
  end
end
