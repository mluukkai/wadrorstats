class AddGithubAddressToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :github, :string
  end
end
