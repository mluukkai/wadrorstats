class AddKeyToProject < ActiveRecord::Migration
  def up
    add_column :projects, :key , :string, null: false, default: ''
    Project.all.each do |project|
      project.update_attribute(:key, generateKeyForProject(project))
    end
    change_column_default :projects, :key, nil
    add_index :projects, :key, unique: true
  end

  def down
    remove_column :projects, :key
  end

  private
  def generateKeyForProject(project)
    SecureRandom.uuid()
  end
end
