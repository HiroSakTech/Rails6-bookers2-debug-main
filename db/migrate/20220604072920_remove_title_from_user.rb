class RemoveTitleFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :title, :string
  end
end
