class AddNameToPeerReviews < ActiveRecord::Migration
  def change
    add_column :peer_reviews, :name, :string
  end
end
