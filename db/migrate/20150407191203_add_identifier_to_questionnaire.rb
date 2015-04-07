class AddIdentifierToQuestionnaire < ActiveRecord::Migration
  def change
    add_column :questionnaires, :identifier, :string
  end
end
