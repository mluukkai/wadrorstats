class AddOption1ToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :option1, :string
  end
end
