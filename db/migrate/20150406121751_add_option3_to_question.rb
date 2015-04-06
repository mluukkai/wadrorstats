class AddOption3ToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :option3, :string
  end
end
