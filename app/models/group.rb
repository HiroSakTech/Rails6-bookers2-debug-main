# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  has_one_attached :group_image

  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
end