class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
