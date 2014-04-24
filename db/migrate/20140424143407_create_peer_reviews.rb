class CreatePeerReviews < ActiveRecord::Migration
  def change
    create_table :peer_reviews do |t|
      t.string :target
      t.integer :score
      t.integer :miniproject_id

      t.timestamps
    end
  end
end
