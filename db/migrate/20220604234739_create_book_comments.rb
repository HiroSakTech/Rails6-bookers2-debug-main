# frozen_string_literal: true

class CreateBookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_comments do |t|
      t.text :comment
      t.references :user_id, null: false, foreign_key: true
      t.references :book_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end