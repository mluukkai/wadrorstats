class AddFieldNormalToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :challenging, :boolean
  end
end
