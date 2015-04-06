class AddOption5ToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :option5, :string
  end
end
