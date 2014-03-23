class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :student_number
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
